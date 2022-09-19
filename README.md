# Ansible Playbook used by Le Filament for deployment of server, odoo, owncloud, nextcloud,  nagios, SSO, drawio, privatebin, framadate, etherpad, jitsi, ...

[![](https://img.shields.io/badge/licence-AGPL--3-blue.svg)](http://www.gnu.org/licenses/agpl "License: AGPL-3")


# Playbooks
Different playbooks are defined here :
  * Initial playbook (initial_playbook.yml) used for initializing server (for accepting Ansible commands)
  * Main playbook (filament_playbook.yml) used for installation and update of server / services
  * Odoo Operations playbook (docker_odoo_operations_playbook.yml) used to perform operations on Odoo Dockers (see below)
  * Docker upgrade images playbook (docker_upgrade_playbook.yml) used to update Docker images

## Odoo Operations playbook
This playbook does not use any role, only tasks with tags.

You can use one of the following tags : 

-  **rebuild_pull_nonprod** or **rebuild_pull_prod** : download latest generic Docker image from Le Filament, update repos list, builds specific Docker image and restarts instance on new image
- **rebuild_nonprod** or **rebuild_prod** : update repos list, builds specific Docker image and restarts instance on new image (without downloading daily generic image)
- **restart_nonprod_on_prod_db** : copyes prod database on test instance and restarts it (needs backup functionalities)
- **restart_nonprod** or **restart_prod** : restart service on locally available image
- **restart_whitelists** : restart whitelists service
- **prod_image_to_test** : copies production Docker image to test (CAUTION, here we are talking about software, not database) - it won't reload on new image, use *restart_test* for that
- **test_image_to_prod** : copies test image to prod - it won't reload on new image, use *restart_prod* or *restart_prod_on_test_image* (which does copy + restart) for that
- **restart_prod_on_test_image** : copies test Dcoker image to prod and restarts prod instance on it (= test_image_to_prod + restart_prod)
- **update_nonprod** ou **update_prod** : update/install modules given as arguments in variable(s) odoo_modules_to_update and/or odoo_modules_to_install

You can define test image to use with  `--extra-vars "odoo_nonprod_instance='<instance>'"` (where <instance> is odoo_test by default).



# Credits

## Contributors

* Remi Cazenave <remi-filament>


## Maintainer

[![](https://le-filament.com/img/logo-lefilament.png)](https://le-filament.com "Le Filament")

This module is maintained by Le Filament
