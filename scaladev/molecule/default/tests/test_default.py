import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


def test_hosts_file(host):
    f = host.file('/etc/hosts')

    assert f.exists
    assert f.user == 'root'
    assert f.group == 'root'


def test_openjdk_8(host):
    jvm = host.package('openjdk-8-jdk')

    assert jvm.is_installed


def test_sbt(host):
    sbt = host.file('/usr/local/bin/sbt')

    assert sbt.exists
