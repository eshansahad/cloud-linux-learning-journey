# Run this from the ROOT of your local cloud-linux-learning-journey clone, in PowerShell.
# Reorganizes cloud/ into platform subfolders: azure/, aws/, gws/, m365/
# Uses git mv so file history is preserved.

$ErrorActionPreference = "Stop"

New-Item -ItemType Directory -Force -Path cloud/azure, cloud/aws, cloud/gws, cloud/m365 | Out-Null

# --- Azure (Day 10-19) ---
git mv cloud/day-10-azure-vmss-load-balancer.md cloud/azure/
git mv cloud/day-11-vmss-autoscaling.md cloud/azure/
git mv cloud/day-12-azure-storage-services.md cloud/azure/
git mv cloud/day-13-app-service-function-logic-apps.md cloud/azure/

# Day 14's original filename has a stray non-ASCII dash character that breaks when typed
# literally in a script, so find it by wildcard instead and rename it properly at the same time.
$day14 = Get-ChildItem -Path cloud -Filter "day-14*.md" | Select-Object -First 1
if ($day14) {
    git mv $day14.FullName cloud/azure/day-14-azure-application-hosting-services.md
} else {
    Write-Host "WARNING: could not find a day-14 file in cloud/ - check it manually." -ForegroundColor Yellow
}

git mv cloud/day-15-azure-cli-vm-lab.md cloud/azure/
git mv cloud/day-16-azure-containerization-lab.md cloud/azure/
git mv cloud/day-17-azure-container-services-hosting.md cloud/azure/
git mv cloud/day-18-azure-security-services.md cloud/azure/
git mv cloud/day-19-azure-database-services.md cloud/azure/

# --- AWS (Day 21-58, excluding Day 20 and 32 which are external project links only) ---
git mv cloud/day-21-aws-budgets-iam.md cloud/aws/
git mv cloud/day-22-aws-ec2-ebs.md cloud/aws/
git mv cloud/day-23-aws-networking-load-balancing.md cloud/aws/
git mv cloud/day-24-aws-efs.md cloud/aws/
git mv cloud/day-25-iis-web-server.md cloud/aws/
git mv cloud/day-26-aws-rds.md cloud/aws/
git mv cloud/day-27-aws-documentdb-apache.md cloud/aws/
git mv cloud/day-28-ubuntu-apache-web-hosting.md cloud/aws/
git mv cloud/day-29-aws-s3-static-website-hosting.md cloud/aws/
git mv cloud/day-30-aws-elastic-beanstalk.md cloud/aws/
git mv cloud/day-31-aws-backup-lambda-batch.md cloud/aws/
git mv cloud/day-33-aws-backup.md cloud/aws/
git mv cloud/day-34-aws-recycle-bin.md cloud/aws/
git mv cloud/day-35-aws-lambda.md cloud/aws/
git mv cloud/day-36-aws-batch.md cloud/aws/
git mv cloud/day-37-amazon-lightsail.md cloud/aws/
git mv cloud/day-38-aws-ecr.md cloud/aws/
git mv cloud/day-39-amazon-eks.md cloud/aws/
git mv cloud/day-40-amazon-athena.md cloud/aws/
git mv cloud/day-41-aws-amplify.md cloud/aws/
git mv cloud/day-42-amazon-sns.md cloud/aws/
git mv cloud/day-43-amazon-sqs.md cloud/aws/
git mv cloud/day-44-amazon-ses.md cloud/aws/
git mv cloud/day-45-s3-sns-event-notification.md cloud/aws/
git mv cloud/day-46-aws-prometheus.md cloud/aws/
git mv cloud/day-47-grafana-monitoring.md cloud/aws/
git mv cloud/day-48-aws-ecs.md cloud/aws/
git mv cloud/day-49-aws-cloudtrail.md cloud/aws/
git mv cloud/day-50-aws-s3-glacier.md cloud/aws/
git mv cloud/day-51-aws-rds-mysql.md cloud/aws/
git mv cloud/day-52-aws-rds-postgresql.md cloud/aws/
git mv cloud/day-53-amazon-aurora.md cloud/aws/
git mv cloud/day-54-amazon-neptune.md cloud/aws/
git mv cloud/day-55-aws-rds-mariadb.md cloud/aws/
git mv cloud/day-56-aws-rds-sql-server.md cloud/aws/
git mv cloud/day-57-aws-dynamodb.md cloud/aws/
git mv cloud/day-58-amazon-workspaces.md cloud/aws/

# --- New platform placeholders (so folders exist and render on GitHub before Day 59 lands) ---
$gwsLines = @(
    "# Google Workspace (GWS)",
    "",
    "Sessions coming soon - this folder will hold day-by-day GWS notes as they are logged."
)
Set-Content -Path cloud/gws/README.md -Value $gwsLines -Encoding UTF8

$m365Lines = @(
    "# Microsoft 365 (M365)",
    "",
    "Sessions coming soon - this folder will hold day-by-day M365 notes as they are logged."
)
Set-Content -Path cloud/m365/README.md -Value $m365Lines -Encoding UTF8

git add cloud/gws/README.md cloud/m365/README.md

Write-Host ""
Write-Host "Reorg complete. Review with: git status"
Write-Host "Then copy the updated README.md into the repo root."
Write-Host "Then commit:"
Write-Host "  git add ."
Write-Host '  git commit -m "Day 59: Reorganize cloud/ into azure/, aws/, gws/, m365/ subfolders"'
Write-Host "  git push origin main"
