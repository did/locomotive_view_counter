require 'spec_helper'

describe Locomotive::ViewCounter::Middleware do

  let(:password)        { nil }
  let(:site)            { instance_double('Site', name: 'Acme Corp') }
  let(:url)             { 'http://www.acme.com/post/hello-world' }
  let(:repository)      { instance_double('Repository') }
  let(:repositories)    { instance_double('Repositories', content_entry: repository) }
  let(:services)        { instance_double('Services', repositories: repositories) }
  let(:content_entry)   { nil }
  let(:live_editing)    { nil }
  let(:app)             { ->(env) { [200, env, ['app']] } }
  let(:middleware)      { described_class.new(app) }
  let(:rack_env)        { build_env }

  subject { code, env, body = middleware.call(rack_env); body.first }

  before { allow(repository).to receive(:with).and_return(repository) }

  describe 'not a content type template' do

    it { is_expected.to eq 'app' }

  end

  describe 'display a content type template' do

    let(:content_type)  { instance_double('PostContentType', fields_by_name: { views: true }) }
    let(:content_entry) { instance_double('Post', title: 'Hello world', content_type: content_type, views: 0) }

    it 'increments the number of views' do
      expect(repository).to receive(:inc).with(content_entry, :views)
      is_expected.to eq 'app'
    end

    context 'live preview on' do

      let(:live_editing) { true }

      it "doesn't increment the number of views" do
        expect(repository).not_to receive(:inc).with(content_entry, :views)
        is_expected.to eq 'app'
      end

    end

    context 'no views attribute' do

      let(:content_type)  { instance_double('PostContentType', fields_by_name: {}) }
      let(:content_entry) { instance_double('Post', title: 'Hello world', content_type: content_type) }
      it { is_expected.to eq 'app' }

    end

  end

  def build_env
    env_for(url).tap do |env|
      env['steam.site']           = site
      env['steam.request']        = Rack::Request.new(env)
      env['steam.services']       = services
      env['steam.content_entry']  = content_entry
      env['steam.live_editing']   = live_editing
    end
  end

  def env_for(url, opts = {})
    Rack::MockRequest.env_for(url, opts)
  end

end
