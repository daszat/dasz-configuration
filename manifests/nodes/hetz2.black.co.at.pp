node 'hetz2.black.co.at' {
  class { 'dasz::defaults':
    location          => hetzner,
    ssh_port          => 2200,
    munin_port        => 4950,
    munin_smart_disks => ['sda', 'sdb'],
    force_nullmailer  => true;
  }
}