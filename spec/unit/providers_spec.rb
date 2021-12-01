require 'spec_helper'
require 'vmpooler/providers'

describe 'providers' do

  let(:providers) do
    Vmpooler::Providers.new
  end

  it '#correct class' do
    expect(providers).to be_a Vmpooler::Providers
  end

  it '#load_all_providers' do
    expect(Vmpooler::Providers.load_all_providers.join(', ')).to match(%r{/lib/vmpooler/providers/base.rb})
    expect(Vmpooler::Providers.load_all_providers.join(', ')).to match(%r{/lib/vmpooler/providers/dummy.rb})
    expect(Vmpooler::Providers.load_all_providers.join(', ')).to match(%r{#{project_root_dir}/lib/vmpooler/providers/vsphere.rb})
  end

  it '#installed_providers' do
    expect(Vmpooler::Providers.installed_providers).to eq(['vmpooler', 'vmpooler-provider-vsphere'])
  end

  it '#load_by_name' do
    expect(Vmpooler::Providers.load_by_name('vsphere').join(', ')).to match(%r{#{project_root_dir}/lib/vmpooler/providers/vsphere.rb})
    expect(Vmpooler::Providers.load_by_name('vsphere').join(', ')).to_not match(%r{base.rb})
    expect(Vmpooler::Providers.load_by_name('vsphere').join(', ')).to_not match(%r{dummy.rb})
  end

  it '#load only vpshere' do
    expect(providers.load_from_gems('vsphere').join(', ')).to match(%r{#{project_root_dir}/lib/vmpooler/providers/vsphere.rb})
    expect(providers.load_from_gems('vsphere').join(', ')).to_not match(%r{base.rb})
    expect(providers.load_from_gems('vsphere').join(', ')).to_not match(%r{dummy.rb})
  end

  it '#load all providers from gems' do
    expect(providers.load_from_gems.join(', ')).to match(%r{/lib/vmpooler/providers/base.rb})
    expect(providers.load_from_gems.join(', ')).to match(%r{/lib/vmpooler/providers/dummy.rb})
    expect(providers.load_from_gems.join(', ')).to match(%r{#{project_root_dir}/lib/vmpooler/providers/vsphere.rb})

  end


end
