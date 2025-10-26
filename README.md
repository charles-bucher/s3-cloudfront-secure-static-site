# IT Support Automation Lab - Learning Project

**Status**: Basic scripting practice | Building automation skills | Not production code

---

## What This Is

I'm learning PowerShell and Bash by writing scripts that automate common IT tasks. This is foundational work—not advanced automation, just getting comfortable with scripting and the command line.

---

## What I've Built

### PowerShell Scripts (Windows)

**System_Info_Collector.ps1**
- Grabs CPU, memory, disk space info
- Outputs to text file
- Why I built it: Learn PowerShell basics, practice file I/O
- What broke: Permissions issues, learned about ExecutionPolicy

**Bulk_User_Creation.ps1**
- Reads CSV file of users
- Creates local user accounts
- Why I built it: Practice loops and CSV parsing
- What I learned: Error handling when users already exist

**File_Cleanup_Automation.ps1**
- Finds files older than X days
- Moves them to archive folder
- Why I built it: Learn file system operations
- Current issue: Need to add better logging

### Bash Scripts (Linux/Mac)

**backup_script.sh**
- Backs up specified directories to tar.gz
- Adds timestamp to filename
- Why I built it: Learn Bash basics, practice with cron
- What broke first: Path issues, permissions

**log_parser.sh**
- Reads log files for error keywords
- Counts occurrences
- Why I built it: Practice grep, awk, text processing
- Still learning: Regular expressions

**aws_resource_check.sh**
- Lists running EC2 instances
- Checks S3 bucket sizes
- Why I built it: Connect scripting to AWS
- What I learned: AWS CLI basics

---

## What I'm Learning

### PowerShell Fundamentals
- Variables and data types
- Loops (ForEach, While)
- Reading/writing files
- Working with objects
- Error handling (Try/Catch)

### Bash Fundamentals  
- Variables and string manipulation
- Pipes and redirection
- grep, awk, sed basics
- File permissions
- Scheduling with cron

### AWS CLI
- Basic commands (ec2, s3)
- Output formatting (json, table)
- Filtering results
- Authentication setup

---

## Real Problems I've Solved

### Problem: Manual System Checks
**Before**: Checking disk space on test VMs manually  
**After**: Script runs automatically, emails if disk > 80%  
**Time saved**: Daily manual checks eliminated

### Problem: Repetitive File Management
**Before**: Moving old log files by hand  
**After**: Automated cleanup runs weekly  
**Benefit**: Never forget, never miss old files

### Problem: AWS Resource Tracking
**Before**: Logging into console to check running instances  
**After**: Script shows all instances with one command  
**Learning**: How AWS CLI works

---

## Current Challenges

### What I'm Stuck On
- **Error handling**: Making scripts fail gracefully
- **Logging**: Writing good logs for troubleshooting
- **Security**: Storing credentials safely (learning about AWS IAM)
- **Modularity**: Making scripts reusable

### What Doesn't Work Well Yet
- Scripts assume happy path (break on unexpected input)
- Not enough input validation
- Limited error messages
- No automated testing

---

## Skills This Demonstrates

- Basic scripting in PowerShell and Bash
- File system operations
- Text processing and parsing
- AWS CLI basics
- Automation mindset
- Learning through doing

---

## Repository Structure

```
it-support-automation-lab/
├── scripts/
│   ├── powershell/
│   │   ├── system_info_collector.ps1
│   │   ├── bulk_user_creation.ps1
│   │   └── file_cleanup_automation.ps1
│   └── bash/
│       ├── backup_script.sh
│       ├── log_parser.sh
│       └── aws_resource_check.sh
├── Docs/
│   ├── powershell_notes.md
│   ├── bash_notes.md
│   └── lessons_learned.md
├── modules/
│   └── (learning to modularize code)
└── screenshots/
    └── script_outputs/
```

---

## Example: System Info Script

**What it does:**
```powershell
# Collects CPU, memory, disk usage
# Outputs to dated text file
# Run daily via Task Scheduler

Get-ComputerInfo | Select-Object CsName, OsArchitecture, 
    @{Name="FreeMemoryGB";Expression={[math]::Round($_.OsFreePhysicalMemory/1MB,2)}}
```

**What I learned:**
- PowerShell object pipeline
- Custom calculated properties
- How to schedule scripts

---

## Honest Skill Level

**What I can do:**
- Write basic PowerShell and Bash scripts
- Automate simple repetitive tasks
- Use AWS CLI for basic operations
- Read documentation and figure things out

**What I can't do yet:**
- Advanced scripting (complex logic)
- Production-ready error handling
- Security best practices (learning)
- Scale automation across many systems

**What I'm actively improving:**
- Error handling and logging
- Code organization and reusability
- Security practices
- Testing my scripts

---

## Why I'm Building This

**Short-term goal**: Build scripting fundamentals for cloud automation  
**Long-term goal**: Automate infrastructure with Terraform and CI/CD  
**Current stage**: Learning the basics before tackling complex automation

Every script here taught me something. Even the ones that barely work.

---

## What This Project Is NOT

- ❌ Not enterprise automation
- ❌ Not production code
- ❌ Not following all best practices yet
- ❌ Not advanced scripting

It's a learning lab where I practice automation basics and make mistakes safely.

---

## Next Steps

1. Add better error handling to all scripts
2. Implement logging standards
3. Learn PowerShell modules
4. Practice AWS Lambda (serverless automation)
5. Connect scripts to CloudWatch events

---

## How to Use These Scripts

**Warning**: These are learning projects. Use at your own risk.

1. Read the script first—understand what it does
2. Test in a safe environment (not production)
3. Modify for your use case
4. Expect to troubleshoot

Better yet: learn from my code and write your own.

---

## What I've Learned

**Lesson 1**: Scripts fail in ways you don't expect—always test  
**Lesson 2**: Good error messages save hours of debugging  
**Lesson 3**: Automation is 20% writing code, 80% handling edge cases  
**Lesson 4**: Documentation helps future me understand past me's code

---

## Technologies Used

- **PowerShell**: Windows automation and scripting
- **Bash**: Linux/Mac scripting
- **AWS CLI**: Cloud resource management
- **Git**: Version control
- **Task Scheduler/Cron**: Script automation

---

## About Me

Self-taught, learning automation at night while working full-time. Building scripting skills to support cloud infrastructure work.

**GitHub**: [charles-bucher](https://github.com/charles-bucher)  
**LinkedIn**: [Charles Bucher](https://linkedin.com/in/charles-bucher85813)  
**Email**: Quietopscb@gmail.com

---

## License

MIT License - This is educational code, use at your own risk.
