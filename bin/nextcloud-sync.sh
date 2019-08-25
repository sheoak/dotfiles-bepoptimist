#! /bin/sh
SILENT=-s
/usr/bin/nextcloudcmd $SILENT --unsyncedfolders ${DOTFILES_PRIVATE}/cloud-unsync -u ${CLOUD_USER} -p $(eval ${CLOUD_PASS_CMD}) ${CLOUD_PATH} ${CLOUD_URL}
