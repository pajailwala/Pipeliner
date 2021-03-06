rule bamstats:
    input:  bam="{x}.dedup.bam",
            bed="exome_targets.bed"
    output: "{x}.dedup.bam.onTarget.bam_stats",
            temp("{x}.dedup.bam.onTarget.bam"),
            "{x}.dedup.bam.bam_stats"
    params: regions="exome_targets.bed",rname="pl:bamstats"
    shell:  "module load bamtools; module load samtools; module load bedtools; perl Scripts/cal.on.target.pl --target_bed {params.regions} {input.bam}"