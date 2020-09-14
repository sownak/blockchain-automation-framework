#!/bin/sh

# Get the nodeInfo file name and store it in a variable
nodeInfoFile=$(basename $(ls additional-node-infos/nodeInfo*))
export nodeInfoFile
envsubst <<"EOF" > additional-node-infos/network-parameters-initial.conf.tmp
notaries : [
  {
<<<<<<< HEAD:platforms/corda-ent/charts/notary-initial-registration/files/create-network-parameters-file.sh
    notaryNodeInfoFile: "notary-nodeinfo/notary_nodeinfo"
    validating = "{{ .Values.notary.validating }}"
=======
    notaryNodeInfoFile: "notary-nodeinfo/${nodeInfoFile}"
    validating = "{{ .Values.nodeConf.notary.validating }}"
>>>>>>> upstream/master:platforms/r3-corda-ent/charts/notary-initial-registration/files/create-network-parameters-file.sh
  }
]
minimumPlatformVersion = 1
maxMessageSize = 10485760
maxTransactionSize = 10485760
eventHorizonDays = 1
EOF

mv additional-node-infos/network-parameters-initial.conf.tmp additional-node-infos/network-parameters-initial.conf
cat additional-node-infos/network-parameters-initial.conf
echo "Create the network-parameters-initial.conf file"
