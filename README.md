# vmpooler-provider-vsphere

- [vmpooler-provider-vsphere](#vmpooler-provider-vsphere)
  - [Usage](#usage)
    - [Custom VM Config Attribute](#custom-vm-config-attribute)
  - [Releasing](#releasing)
  - [License](#license)

This is a provider for [VMPooler](https://github.com/puppetlabs/vmpooler) allows using vSphere as a source of machines. This provider was originally part of the main VMPooler code base but was extracted to be a standalone gem so that development could be done independently of VMPooler itself.

## Usage

Include this gem in the same Gemfile that you use to install VMPooler itself and then define one or more pools with the `provider` key set to `vsphere`. VMPooler will take care of the rest.

Examples of deploying VMPooler with this provider can be found in the [puppetlabs/vmpooler-deployment](https://github.com/puppetlabs/vmpooler-deployment) repository.

### Custom VM Config Attribute

This provider sets a custom attribute on the VM called `guestinfo.hostname` to the name of the generated VM, which can be queried from inside the guest OS if VMware Tools is isntalled. For example:

macOS: `"/Library/Application Support/VMware Tools/vmware-tools-daemon" --cmd "info-get guestinfo.hostname"`
Linux or Windows Guest: `vmtoolsd --cmd "info-get guestinfo.hostname"`

See the [VMware Tools Administration docs](https://docs.vmware.com/en/VMware-Tools/12.1.0/com.vmware.vsphere.vmwaretools.doc/GUID-D026777B-606D-4442-957A-B953C2049659.html) for more information about querying information from the GuestInfo variable.

## Releasing

Follow these steps to publish a new GitHub release, and build and push the gem to <https://rubygems.org>.

1. Run `./update-changelog` to update `CHANGELOG.md`.
2. Bump the "VERSION" in `lib/vmpooler-provider-vsphere/version.rb` appropriately based on changes in `CHANGELOG.md` since the last release.
3. Commit and push changes to a new branch, then open a pull request against `main` and be sure to add the "maintenance" label.
4. After the pull request is approved and merged, then navigate to Actions --> Release Gem --> run workflow --> Branch: main --> Run workflow.

## License

vmpooler-provider-vsphere is distributed under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0.html). See the [LICENSE](LICENSE) file for more details.
