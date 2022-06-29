#!/bin/bash

CMSSW_VERSION="CMSSW_12_3_1"
ANALYSIS_DIR=$HOME/Analysis

mkdir -p $ANALYSIS_DIR && cd $_
echo "The CMSSW version used for the analysis FW $CMSSW_VERSION"
echo "Analysis directory is $ANALYSIS_DIR"
cmsrel $CMSSW_VERSION && cd $_
cmsenv
cd $CMSSW_BASE/src

pip install gita --user

echo "=================================================================="
echo "================== Setting up file-cataloging ===================="
echo "=================================================================="

git clone git@github.com:Laurits7/file-cataloging.git
git clone git@github.com:HEP-KBFI/nanoAOD-tools.git -b master12x PhysicsTools/NanoAODTools
cd file-cataloging
pip install -r requirements.txt --user
pip install -e . --user

cd $CMSSW_BASE/src

echo "=================================================================="
echo "======== Cloning dependencies for TallinnNtupleProducer =========="
echo "=================================================================="

git clone git@github.com:HEP-KBFI/TallinnNtupleProducer.git
git clone -b run2_SFs https://github.com/HEP-KBFI/TauTriggerSFs TauAnalysisTools/TauTriggerSFs
git clone https://github.com/cms-tau-pog/TauIDSFs TauPOG/TauIDSFs


echo "=================================================================="
echo "========== Cloning dependencies for TallinnJobHandling ==========="
echo "=================================================================="

git clone git@github.com:HEP-KBFI/TallinnJobHandling.git


gita add -a .

scram b -j8