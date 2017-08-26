# Kube

The Kube gem wraps the Imperavi Kube CSS & JS framework (hereafter Kube framework) for the Rails asset pipeline.

In order to make the variables available at runtime I decided to convert the majority of the SASS variables to CSS Custom Properties. In doing so you can now get and set CSS Custom Property values using Javascript. Unfortunately I couldn't find an acceptable workaround for the remaining 5 SASS variables that are used to generate the grid. However, I didn't find this particularly necessary in my projects anyway.

CSS Custom Properties permit the declaration and usage of cascading variables in stylesheets. [caniuse.com](https://caniuse.com/#feat=css-variables) reports global support at 72.2%. The main exceptions are Internet Explorer and Opera Mini. Edge 15 has partial support but only due to there being bugs present, so expect this will be fixed soon and full support will be present in that browser too.

### Please Note

Imperavi's [original version](https://github.com/imperavi/kube) of this framework boasts support for latest Chrome, Firefox, Safari and Opera; and Microsoft Edge and Internet Explorer 11. The changes I have made using CSS Custom Properties affects this support.

Please consult [caniuse.com](https://caniuse.com/#feat=css-variables) when making your decision about whether this gem is appropriate for your product.

## Versioning

The Kube gem matches the source library version for major, minor and patch numbers.
We reserve the last number, the revision for gem releases.

As an example, with Kube framework V6.5.2 this gem will have the following properties:

```ruby
Kube::Version::Compact
=> 6.5.2.0
```

If we release a revision to our code in between Kube framework releases:

```ruby
Kube::Version::Compact
=> 6.5.2.1

Kube::Version::Revision
=> 1
```

A matching release number will a list of changes will appear in `CHANGELOG.md`.

## Installation

To install add the line to your Gemfile:

```
gem 'kube', '6.5.2.0'
```

And `bundle`.

## Dependencies

**Rails 5.1+**
The Rails JavaScript helpers have been rewritten and published in a new gem called `rails-ujs`. They now they use vanilla JavaScript, so jQuery is not a dependency of Rails anymore. Since Kube  relies on it, install it with ```bin/yarn add jquery``` or  via ```gem 'jquery-rails'```  and add ```//= require jquery``` to ```application.js```.

**NOTE:** Ensure that the `sass-rails` gem is present in your Gemfile.

## Adding the Kube javascript

Add the following to your application.js:

```js
# app/assets/javascripts/application.js
//= require jquery3
//= require kube
```

## Adding the Kube stylesheet

Import Kube styles in `application.scss`:

```css
@import "kube/all";
```

**NOTE:** If you have just generated a new Rails application, it  may come with a `.css` file instead. If this file exists, it will be served instead of Sass, so remove it.

```
$ mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss
```

If you don't want to use the default Kube styles and want control over fonts, colors, padding, margins etc., you can set your own values by changing the CSS Custom Properties.

Use the built in Kube installer to copy the Kube properties scss file:

```
$ rails generate kube:install
```

This will create `app/assets/stylesheets/_kube_properties.scss`.

Import this file into your `application.scss` and switch from using `kube/all` to just `kube`:

```css
@import "kube_properties";
@import "kube";
```
If you take a look at `_kube_properties.scss` you see that all CSS Custom Properties are set under the `:root` pseudo-selector rule. This effectively make them global.

You can now set the value of any property and it will be used at runtime by the browser.

In addition you can access and change CSS Custom Properties at runtime in the browser using Javascript.

To get a custom property value set on the root element, get the styles applied to `document.documentElement`:

```js
var rootStyles = getComputedStyle(document.documentElement);
var defaultColor = rootStyles.getPropertyValue('--color-text');
```

Since these are runtime properties, values can be updated dynamically:

```js
document.documentElement.style.setProperty('--color-text', '#c80');
```

The change will be effectively immediately in the browser.

## About the grid variables

The grid variables are still declared in SASS. To change these use the following setup in your `application.scss` file:

```css
// Import the Kube SASS variables and override one or more values:
@import "kube/variables";

// BREAKPOINTS
$sm: 768px;
$md: 1024px;
$lg: 1200px;

// GRID
$grid-columns: 12;
$grid-gutter: 2%;

// Import the Kube CSS Custom Properties:
@import "kube/properties";
// or if you have installed the _kube_properties.scss:
// @import "kube_properties";

// Import the rest of Kube:
@import "kube/mixins";
@import "kube/components";
```

## Acknowledgements

Kube framework is made by and copyright [Imperavi LLC](https://imperavi.com/kube).

This gem was written and is maintained by [Jurgen Jocubeit](https://github.com/JurgenJocubeit).

## License

Kube framework is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

This gem is also available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Copyright

Copyright 2017 Jurgen Jocubeit
