# Install
Downlaod terraformer from https://github.com/GoogleCloudPlatform/terraformer/releases

Please select the release based on your platform.

for example, on windows:

Set path enviornment to point it to terraformer exe

# Setup Envornment

for example, Windows Powersehll:

```Powershell

$Env:ARM_SUBSCRIPTION_ID = 'your azure subscription id'
```

# Run

```
terraform init
terraformer import azure -r * -R data
```