#! /bin/sh
/usr/bin/nextcloudcmd -s --unsyncedfolders ${DOTFILES_PRIVATE}/cloud-unsync -u ${CLOUD_USER} -p $(eval ${CLOUD_PASS_CMD}) ${CLOUD_PATH} ${CLOUD_URL}
