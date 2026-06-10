## **Azure Administration Lab Report** 

Name: Eshan Sahad Subject: Azure Administration Date: 10-06-2026 

## **Objective** 

To perform Azure administration tasks including: 

- Create a Linux-based VM Scale Set. 

- Configure autoscaling with defined minimum, maximum, and default instance counts. 

- Enable scaling rules based on CPU percentage. 

- Install and execute the stress command on a VMSS instance to simulate high CPU usage. 

- Monitor autoscale activity and instance count changes. 

## **Task 1: Create Virtual Machine Scale Set (VMSS)** 

## **Step 1: Provision via Azure Portal** 

Create a new Resource Group (e.g my_resource_group). 

- Select Ubuntu Server LTS image. 

- Set Instance size to Standard_B1s. 

- Set initial instance count to 1. 

- Enable public inbound ports for SSH. 

## **Explanation:** 

The Standard_B1s size is chosen because it has limited baseline performance, making it easier to rapidly saturate the CPU during testing. **Verify:** 

Navigate to the VMSS Overview page to check the deployment status. 

## **Task 2: Configure Autoscaling Rules** 

## **Step 1: Set Instance limits** 

- Minimum: 1 

- Maximum: 3 

- Default: 1 

## **Step 2: Add Scale-Out Rule** 

- Metric: Percentage CPU > 75% 

- Duration: 5 minutes 

- Operation: Increase count by 1 

## **Step 3: Add Scale-In Rule** 

- Metric: Percentage CPU < 25% 

- Duration: 5 minutes 

- Operation: Decrease count by 1 

## **Explanation:** 

Custom autoscale rules allow Azure to automatically handle workload fluctuations by provisioning or de-provisioning instances based on strict metric thresholds. 

## **Verify:** 

Check the Scaling settings page in the portal to ensure the profile is saved. 

**Task 2 Result:** Autoscale limits and custom metric rules were successfully established. 

## **Task 3: Connect to VMSS and Install Stress Utility** 

## **Step 1: Connect via SSH** 

Bash ssh username@<public-ip> 

**Step 2: Update packages** Bash sudo apt update 

**Step 3: Install stress utility** 

Bash sudo apt install stress -y 

## **Explanation:** 

apt updates package repositories and installed packages. The stress package is used to artificially burden system resources. 

## **Verify:** 

Bash stress --version 

**Task 3 Result:** SSH connection was successfully established and the required testing utility was installed. 

## **Task 4: Generate CPU Load** 

**Step 1: Execute stress command** Bash stress --cpu 4 --timeout 300 

## **Explanation:** 

The stress command spawns 4 workers spinning on sqrt() to maximize CPU utilization for 300 seconds (5 minutes), ensuring the 75% threshold is crossed for the required duration. 

## **Verify:** 

Navigate to the Azure Portal and check the Metrics dashboard for the "Percentage CPU" metric. 

**Task 4 Result:** Artificial CPU load was successfully generated and registered by Azure Monitor. 

## **Task 5: Monitor Autoscale Activity** 

## **Step 1: Observe Scale-Out** 

Wait for the 5-minute threshold to complete while the CPU remains at 100%. 

## **Verify:** 

Check the "Instances" tab. The instance count should increase from 1 to 2. 

## **Step 2: Observe Scale-In** 

Wait for the stress command to time out, allowing the CPU to drop below 25%. Wait an additional 5 minutes for the evaluation period. 

## **Verify:** 

Check the "Instances" tab. The excess instance should be deleted, returning the count to 1. 

## **Explanation:** 

Azure dynamically evaluates aggregated host metrics and adjusts compute resources autonomously based on the configured rules. 

## **Result** 

All Azure administration tasks including VMSS provisioning, autoscale configuration, load generation, and dynamic resource scaling were successfully completed. 

