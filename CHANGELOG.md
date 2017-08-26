# Changelog

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

A matching revision entry will appear in this CHANGELOG to explain the changes.

## Unreleased

(nothing)

## 6.5.2.0

- Initial release.
