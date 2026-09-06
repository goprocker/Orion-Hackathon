import openpyxl
import re

def clean_username(text):
    if text is None:
        return ""
    # Remove all non-alphanumeric characters or spaces and convert to uppercase
    # Keeping alphanumeric characters for clean usernames
    res = str(text).upper()
    return re.sub(r'[^A-Z0-9_]', '', res)

def clean_password(text):
    if text is None:
        return ""
    # Remove all spaces and non-alphanumeric characters and convert to uppercase
    res = str(text).upper()
    return re.sub(r'[^A-Z0-9]', '', res)

# Load source excel file
wb_source = openpyxl.load_workbook('ORION 1.0 .xlsx')
sheet = wb_source.active

# Create destination workbook
wb_dest = openpyxl.Workbook()
dest_sheet = wb_dest.active
dest_sheet.title = "User Credentials"

# Add header row
dest_sheet.append(["username", "password"])

count = 0
for r in range(2, sheet.max_row + 1):
    raw_team = sheet.cell(row=r, column=3).value
    raw_leader = sheet.cell(row=r, column=5).value
    
    if raw_team is None or str(raw_team).strip() == '':
        continue

    # username: Team Name (no spaces, ALL CAPS)
    username = clean_username(raw_team)
    
    # password: Team Leader Name (no spaces, ALL CAPS)
    password = clean_password(raw_leader)

    dest_sheet.append([username, password])
    count += 1

saved_files = []

# Try saving to username.xlsx
try:
    wb_dest.save('username.xlsx')
    saved_files.append('username.xlsx')
except PermissionError:
    pass

# Try saving to username_updated.xlsx
try:
    wb_dest.save('username_updated.xlsx')
    saved_files.append('username_updated.xlsx')
except PermissionError:
    pass

# Always save fallback username_credentials.xlsx if both are locked
if not saved_files:
    wb_dest.save('username_credentials.xlsx')
    saved_files.append('username_credentials.xlsx')

print(f"Processed {count} records successfully!")
print(f"Saved to file(s): {', '.join(saved_files)}")
