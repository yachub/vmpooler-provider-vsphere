# vmpooler-provider-vsphere

This is a provider for [VMPooler](https://github.com/puppetlabs/vmpooler) allows using vSphere as a source of machines. This provider was originally part of the main VMPooler code base but was extracted to be a standalone gem so that development could be done independently of VMPooler itself.

## Usage

Include this gem in the same Gemfile that you use to install VMPooler itself and then define one or more pools with the `provider` key set to `vsphere`. VMPooler will take care of the rest.

Examples of deploying VMPooler with this provider can be found in the [puppetlabs/vmpooler-deployment](https://github.com/puppetlabs/vmpooler-deployment) repository.

## License

vmpooler-provider-vsphere is distributed under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0.html). See the [LICENSE](LICENSE) file for more details.
