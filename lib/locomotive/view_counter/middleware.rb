module Locomotive
  module ViewCounter

    class Middleware

      def initialize(app)
        @app = app
      end

      def call(env)
        if !env['steam.live_editing'] && entry = env['steam.content_entry']
          increment_view_counter(entry, env.fetch('steam.services'))
        end

        @app.call(env)
      end

      private

      def increment_view_counter(entry, services)
        type = entry.content_type

        if type.fields_by_name[:views]
          repository = services.repositories.content_entry.with(type)
          repository.inc(entry, :views)
        end
      end

    end

  end
end
