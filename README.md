# View counter for Locomotive content entries

## Assumptions

- you add a field named **views** in any of your content types.
- your **views** field is not localized.
- the view counter is incremented when browsing a content entry outside the live editing mode.
- you use one of the very last commits of Steam (https://github.com/locomotivecms/steam/commit/11112284764604e3bc21ed6306605f1fa0e1f7a7).

## Installation

### Wagon

In the Gemfile of your Wagon site:

      group :misc do
        # Add your extra gems here
        # gem 'susy', require: 'susy'
        # gem 'bourbon', require: 'bourbon'
        gem 'locomotivecms_view_counter', github: 'did/locomotive_view_counter', require: true
      end

### Engine

    gem 'locomotivecms_view_counter', github: 'did/locomotive_view_counter', require: true

## TODO

- support localized views field.

## Contact

Feel free to contact me at did at locomotivecms dot com.

Copyright (c) 2016 NoCoffee, released under the MIT license


