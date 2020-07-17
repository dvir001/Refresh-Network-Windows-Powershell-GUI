function Show-RefreshNetwork_psf
{
	# Import the Assemblies
	[void][reflection.assembly]::Load('System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	
	# Form Objects
	[System.Windows.Forms.Application]::EnableVisualStyles()
	$formRefreshNetwork = New-Object 'System.Windows.Forms.Form'
	$checkboxRegisterDNS = New-Object 'System.Windows.Forms.CheckBox'
	$checkboxRenewIP = New-Object 'System.Windows.Forms.CheckBox'
	$checkboxReleaseIP = New-Object 'System.Windows.Forms.CheckBox'
	$checkboxFlushDNS = New-Object 'System.Windows.Forms.CheckBox'
	$buttonOK = New-Object 'System.Windows.Forms.Button'
	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
	
	# Script
	$formRefreshNetwork_Load = {
		# Empty }
		
		$buttonOK_MouseClick = [System.Windows.Forms.MouseEventHandler]{
			# Event Argument: $_ = [System.Windows.Forms.MouseEventArgs]
			if ($checkboxFlushDNS.Checked) { ipconfig /flushdns }
			if ($checkboxReleaseIP.Checked) { ipconfig /release }
			if ($checkboxRenewIP.Checked) { ipconfig /renew }
			if ($checkboxRegisterDNS.Checked) { ipconfig /registerdns }
		}
		$checkboxFlushDNS_CheckedChanged = { <# Empty #> }
		$checkboxReleaseIP_CheckedChanged = { <# Empty #> }
		$checkboxRenewIP_CheckedChanged = { <# Empty #> }
		$checkboxRegisterDNS_CheckedChanged = { <# Empty #> }
		
		# region Generated Events
		$Form_StateCorrection_Load =
		{
			# Correct the initial state of the form to prevent the .Net maximized form issue
			$formRefreshNetwork.WindowState = $InitialFormWindowState
		}
		
		$Form_Cleanup_FormClosed =
		{
			# Remove all event handlers from the controls
			try
			{
				$checkboxRegisterDNS.remove_CheckedChanged($checkboxRegisterDNS_CheckedChanged)
				$checkboxRenewIP.remove_CheckedChanged($checkboxRenewIP_CheckedChanged)
				$checkboxReleaseIP.remove_CheckedChanged($checkboxReleaseIP_CheckedChanged)
				$checkboxFlushDNS.remove_CheckedChanged($checkboxFlushDNS_CheckedChanged)
				$buttonOK.remove_MouseClick($buttonOK_MouseClick)
				$formRefreshNetwork.remove_Load($formRefreshNetwork_Load)
				$formRefreshNetwork.remove_Load($Form_StateCorrection_Load)
				$formRefreshNetwork.remove_FormClosed($Form_Cleanup_FormClosed)
			}
			catch { Out-Null <# Prevent PSScriptAnalyzer warning #> }
		}
		# Form Code
		$formRefreshNetwork.SuspendLayout()
		
		# formRefreshNetwork
		$formRefreshNetwork.Controls.Add($checkboxRegisterDNS)
		$formRefreshNetwork.Controls.Add($checkboxRenewIP)
		$formRefreshNetwork.Controls.Add($checkboxReleaseIP)
		$formRefreshNetwork.Controls.Add($checkboxFlushDNS)
		$formRefreshNetwork.Controls.Add($buttonOK)
		$formRefreshNetwork.AcceptButton = $buttonOK
		$formRefreshNetwork.AutoScaleDimensions = '6, 13'
		$formRefreshNetwork.AutoScaleMode = 'Font'
		$formRefreshNetwork.ClientSize = '215, 141'
		$formRefreshNetwork.FormBorderStyle = 'FixedDialog'
		$formRefreshNetwork.MaximizeBox = $False
		$formRefreshNetwork.MinimizeBox = $False
		$formRefreshNetwork.Name = 'formRefreshNetwork'
		$formRefreshNetwork.StartPosition = 'CenterScreen'
		$formRefreshNetwork.Text = 'Refresh Network'
		$formRefreshNetwork.add_Load($formRefreshNetwork_Load)
		
		# checkboxRegisterDNS
		$checkboxRegisterDNS.Checked = $True
		$checkboxRegisterDNS.CheckState = 'Checked'
		$checkboxRegisterDNS.Location = '12, 102'
		$checkboxRegisterDNS.Name = 'checkboxRegisterDNS'
		$checkboxRegisterDNS.Size = '104, 24'
		$checkboxRegisterDNS.TabIndex = 4
		$checkboxRegisterDNS.Text = 'Register DNS'
		$checkboxRegisterDNS.UseCompatibleTextRendering = $True
		$checkboxRegisterDNS.UseVisualStyleBackColor = $True
		$checkboxRegisterDNS.add_CheckedChanged($checkboxRegisterDNS_CheckedChanged)
		
		# checkboxRenewIP
		$checkboxRenewIP.Checked = $True
		$checkboxRenewIP.CheckState = 'Checked'
		$checkboxRenewIP.Location = '12, 72'
		$checkboxRenewIP.Name = 'checkboxRenewIP'
		$checkboxRenewIP.Size = '104, 24'
		$checkboxRenewIP.TabIndex = 3
		$checkboxRenewIP.Text = 'Renew IP'
		$checkboxRenewIP.UseCompatibleTextRendering = $True
		$checkboxRenewIP.UseVisualStyleBackColor = $True
		$checkboxRenewIP.add_CheckedChanged($checkboxRenewIP_CheckedChanged)
		
		# checkboxReleaseIP
		$checkboxReleaseIP.Checked = $True
		$checkboxReleaseIP.CheckState = 'Checked'
		$checkboxReleaseIP.Location = '12, 42'
		$checkboxReleaseIP.Name = 'checkboxReleaseIP'
		$checkboxReleaseIP.Size = '104, 24'
		$checkboxReleaseIP.TabIndex = 2
		$checkboxReleaseIP.Text = 'Release IP'
		$checkboxReleaseIP.UseCompatibleTextRendering = $True
		$checkboxReleaseIP.UseVisualStyleBackColor = $True
		$checkboxReleaseIP.add_CheckedChanged($checkboxReleaseIP_CheckedChanged)
		
		# checkboxFlushDNS
		$checkboxFlushDNS.Checked = $True
		$checkboxFlushDNS.CheckState = 'Checked'
		$checkboxFlushDNS.Location = '12, 12'
		$checkboxFlushDNS.Name = 'checkboxFlushDNS'
		$checkboxFlushDNS.Size = '104, 24'
		$checkboxFlushDNS.TabIndex = 1
		$checkboxFlushDNS.Text = 'Flush DNS'
		$checkboxFlushDNS.UseCompatibleTextRendering = $True
		$checkboxFlushDNS.UseVisualStyleBackColor = $True
		$checkboxFlushDNS.add_CheckedChanged($checkboxFlushDNS_CheckedChanged)
		
		# buttonOK
		$buttonOK.Anchor = 'Bottom, Right'
		$buttonOK.DialogResult = 'OK'
		$buttonOK.Location = '128, 106'
		$buttonOK.Name = 'buttonOK'
		$buttonOK.Size = '75, 23'
		$buttonOK.TabIndex = 0
		$buttonOK.Text = '&OK'
		$buttonOK.UseCompatibleTextRendering = $True
		$buttonOK.UseVisualStyleBackColor = $True
		$buttonOK.add_MouseClick($buttonOK_MouseClick)
		$formRefreshNetwork.ResumeLayout()
		# endregion Generated Form Code
		
		# Save the initial state of the form
		$InitialFormWindowState = $formRefreshNetwork.WindowState
		# Init the OnLoad event to correct the initial state of the form
		$formRefreshNetwork.add_Load($Form_StateCorrection_Load)
		# Clean up the control events
		$formRefreshNetwork.add_FormClosed($Form_Cleanup_FormClosed)
		# Show the Form
		return $formRefreshNetwork.ShowDialog()
	}
}

# Call the form
	Show-RefreshNetwork_psf | Out-Null
