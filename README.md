# VNC for Nagesen Azure WebSites Service
This is AzureResourceManager template and VMExtension custom script.


<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fdarkcrash%2FVncForNagesen%2Fmaster%2FVncForNagesen%2FTemplates%2FLinuxVirtualMachine.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fdarkcrash%2FVncForNagesen%2Fmaster%2FVncForNagesen%2FTemplates%2FLinuxVirtualMachine.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

## What's Nagesen ?
visit <a href="https://github.com/ohotech/nagesen_web">this page</a>.

and <a href="http://naas.azurewebsites.net/">http://naas.azurewebsites.net/</a>

## using

 wait for 40 minute after deploy.

- http://{your publicIP or DNS}:6080/vnc_auto.html

- http://naas.azurewebsites.net/Room/{RoomNumber}/

look at room number in vnc.

Announce that url to room members.


## TroubleShoot

restart azure virtual machine.
