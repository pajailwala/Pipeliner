rule make_target_files:
    input: expand("{s}.R1.trimmed.fastq.gz", s=samples)
    output: targets="exome_targets.bed",
            cnvkittargets="cnvkit_targets.bed",
            cnvkitantitargets="cnvkit_antitargets.bed"
    params: bed=config['project']['targetspath'],rname="pl:targets"
    shell: "perl Scripts/reformat_bed.pl {params.bed}; module load cnvkit; cnvkit.py target --split -o {output.cnvkittargets} {params.bed}; cnvkit.py antitarget -o {output.cnvkitantitargets} {params.bed}"