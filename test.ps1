$url="https://onosys.slack.com/services/hooks/slackbot?token=p6vABtpflPwagUYUiOUO5wwf&channel=%23testbuild"

$requestedFor="$env:BUILD_REQUESTEDFOR"
$branch = "$env:BUILD_SOURCEBRANCHNAME"
$buildUrl="$env:BUILD_BUILDURI"

$buidId="$env:BUILD_BUILDID"
$buildDefName="$env:BUILD_DEFINITIONNAME"
$buildDefVersion="$env:BUILD_DEFINITIONVERSION"
$buildNum="$env:BUILD_BUILDNUMBER"
$buildUri="$env:BUILD_BUILDURI"
$buldQueuedBy="$env:BUILD_QUEUEDBY"
$buildSrcVersion="$env:BUILD_SOURCEVERSION"
$buildSrcBranch="$env:BUILD_SOURCEBRANCH"
$buildSrcBranchName="$env:BUILD_SOURCEBRANCHNAME"
$buildRepoName="$env:BUILD_REPOSITORY_NAME"
$buildRepoProvider="$env:BUILD_REPOSITORY_PROVIDER"
$buildRepoClean="$env:BUILD_REPOSITORY_CLEAN"
$buildRepoURI="$env:BUILD_REPOSITORY_URI"

$agentHomeDir="$env:AGENT_HOMEDIRECTORY"
$agentWorkFolder="$env:AGENT_WorkFolder"

$buildRepoLocalPath="$env:BUILD_REPOSITORY_LOCALPATH"
$buildSrcsDir="$env:BUILD_SOURCESDIRECTORY"
$buildArtifactsStagingDir="$env:BUILD_ARTIFACTSTAGINGDIRECTORY"
$buildStagingDir="$env:BUILD_STAGINGDIRECTORY"
$agentBuildDir="$env:AGENT_BUILDDIRECTORY"

$envVars = Get-Variable |%{ "Name : {0}`r`nValue: {1}`r`n" -f $_.Name,$_.Value }
Write-Host $envVars

$parameters = "Build started by $requestedFor, on $branch is running."

$http_request = New-Object -ComObject Msxml2.XMLHTTP
$http_request.open('POST', $url, $false)
$http_request.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
$http_request.setRequestHeader("Content-length", $parameters.length)
$http_request.setRequestHeader("Connection", "close")
$http_request.send($parameters)
$http_request.statusText