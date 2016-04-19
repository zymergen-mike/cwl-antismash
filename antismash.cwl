#!/usr/bin/env cwl-runner
cwlVersion: cwl:draft-3

class: CommandLineTool

description: "Run antiSMASH"

baseCommand: run_antismash.py

hints:
  - class: DockerRequirement
    dockerPull: antismash/antismash

arguments:
  - prefix: "--outputfolder"
    valueFrom: $(inputs.outputfolder)

inputs:
  - id: sequence
    type: File
    inputBinding:
      position: 1
  - id: verbose
    type: ["null", boolean]
    inputBinding:
      prefix: "--verbose"


outputs:
  - id: result
    type: File
    outputBinding:
      glob: "$(inputs.outputfolder)/*.final.gbk"
