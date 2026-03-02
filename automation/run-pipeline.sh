#!/usr/bin/env bash

# Simulación de ejecución de pipeline
# Este script representa lo que un sistema CI ejecutará automáticamente.
# Aún se ejecuta manualmente en esta fase del laboratorio.

set -Eeuo pipefail

PIPELINE_NAME="DEVOPS-LAB PIPELINE"
RUN_ID=$(date +"%Y%m%d-%H%M%S")
CURRENT_STAGE="INIT"

log() {
  echo "[${PIPELINE_NAME}] [RUN:${RUN_ID}] $1"
}
handle_error() {
local exit_code=$?
echo ""
echo "X PIPELINE FAILED"
echo "Stage: ${CURRENT_STAGE}"
echo "Exit Code: ${exit_code}"
echo "Timestamp: $(date)"
exit $exit_code
}
trap 'handle_error' ERR


stage() {
    STAGE_NAME="$1"
    CURRENT_STAGE="$STAGE_NAME"
    log "========== STAGE: ${STAGE_NAME} =========="
}

init() {
    stage "INIT"
    log "Preparing execution environment"
    pwd
} 

validate()  {
    stage "VALIDATE"
    log "Running repository validation checks"
    test -f docker/Dockerfile
    test -f README.md
}

build() {
    stage "BUILD"
    log "Simulating container build"
    echo "docker build would run here"
}

test_phase() {
    stage "TEST"
    log "Simulating validation test"
    
    #Simulacion de test controlado
    echo "Running dummy test..."
    true
}

report() {
    stage "REPORT"
    log "Pipeline completed successfully"
}

main() {
    init
    validate
    build
    test_phase
    report
}

main "$@"