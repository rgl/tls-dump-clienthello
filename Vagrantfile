Vagrant.configure('2') do |config|
  config.vm.provider :libvirt do |lv, config|
    lv.cpus = 4
    lv.memory = 4*1024
    lv.keymap = 'pt'
    config.vm.synced_folder '.', '/vagrant', type: 'smb', smb_username: ENV['USER'], smb_password: ENV['VAGRANT_SMB_PASSWORD']
  end

  [
    '2019',
    '2022',
  ].each do |version|
    config.vm.define "windows-#{version}" do |config|
      config.vm.box = "windows-#{version}-amd64"
      config.vm.synced_folder 'example-clients', '/tmp/example-clients', type: 'rsync', rsync__exclude: [
        '.gradle/',
        '_build/',
        'node_modules/',
        'build/',
        'bin/',
        'obj/',
        'target/',
        '*.jar',
        '*.zip']
      config.vm.provision :file, source: 'example.com-crt.pem', destination: '/tmp/'
      config.vm.provision :shell, path: 'provisioning/windows/ps.ps1', args: 'provision-chocolatey.ps1'
      if version == '2019'
        config.vm.provision :shell, path: 'provisioning/windows/ps.ps1', args: 'provision-dotnet.ps1'
        config.vm.provision :reload
      end
      config.vm.provision :shell, path: 'provisioning/windows/ps.ps1', args: 'provision-common.ps1'
      config.vm.provision :shell, path: 'provisioning/windows/ps.ps1', args: 'provision-tools.ps1'
      config.vm.provision :shell, path: 'provisioning/windows/ps.ps1', args: 'provision-tls-dump-clienthello.ps1'
      config.vm.provision :shell, path: 'provisioning/windows/run-example-clients.ps1'
    end
  end
end
