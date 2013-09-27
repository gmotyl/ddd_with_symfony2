require File.dirname(__FILE__) + '/hostmaster/command/base'
require File.dirname(__FILE__) + '/hostmaster/command/root'
require File.dirname(__FILE__) + '/hostmaster/config'
require File.dirname(__FILE__) + '/hostmaster/vm'
require File.dirname(__FILE__) + '/hostmaster/middleware/remove'
require File.dirname(__FILE__) + '/hostmaster/middleware/update'

Vagrant.commands.register(:hosts) { Vagrant::Hostmaster::Command::Root }
Vagrant.config_keys.register(:hosts) { Vagrant::Hostmaster::Config }

Vagrant.actions[:destroy].insert_after(Vagrant::Action::VM::ProvisionerCleanup, Vagrant::Hostmaster::Middleware::Remove)

Vagrant.actions[:provision].insert_after(Vagrant::Action::VM::Provision, Vagrant::Hostmaster::Middleware::Update)
Vagrant.actions[:start].insert_after(Vagrant::Action::VM::Provision, Vagrant::Hostmaster::Middleware::Update)
