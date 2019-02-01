### Important Notice

**This project is no longer being maintained. It has been made obsolete by the release of the [Vagrant VMware Desktop Plugin](https://www.hashicorp.com/blog/introducing-the-vagrant-vmware-desktop-plugin), which now includes support for the Vagrant `package` command.**

# vagrant-package-vmware

`vagrant-package-vmware` is a [Vagrant](http://vagrantup.com) plugin for packaging a running VMware vagrant environment into a box.

## Installation

Use `vagrant plugin` to install the gem in your Vagrant environment:

```bash
$ vagrant plugin install vagrant-package-vmware
```

## Usage

```bash
$ vagrant package-vmware -h

Usage: vagrant package-vmware [options] [name|id]

Options:

        --output NAME                Name of the file to output
        --include FILE,FILE..        Comma separated additional files to package with the box
        --vagrantfile FILE           Vagrantfile to package with the box
    -h, --help                       Print this help
```

## Example

```bash
$ vagrant package-vmware 7d54359 --output new.box

Cloning machine...
Compressing package to: /Users/vagrant/new.box
```

## Development

The vagrant-vmware-fusion plugin really doesn't like being loaded from a vendor'ed vagrant, so you can't use the usual technique of `bundle exec vagrant ...` to test this plugin. The following commands build and install the checked-out gem:

```bash
$ bundle exec rake build
$ vagrant plugin uninstall vagrant-package-vmware
$ vagrant plugin install pkg/vagrant-package-vmware-*.gem
$ vagrant package-vmware -h
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bacongravy/vagrant-package-vmware.
