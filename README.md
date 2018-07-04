# Middleman Site Extension

The Middleman Site Extension adds support for Middleman to Azure Web App.

## Install

1. Create an Azure Web App
2. Set an App Setting for `SCM_COMMAND_IDLE_TIMEOUT` to `600`
3. [Install](http://blog.syntaxc4.net/post/2015/02/05/how-to-enable-a-site-extension-in-azure-websites.aspx) the Middleman Site Extension

> Note: This site extension downloads `ruby` and `devkit` so the installation takes longer than the portal timeout, so you may see an error in the portal, however the installation should complete. Be Patient.

That's it! Just hook up your GitHub Account or Push a local Git Repo with your Middleman site.

You can optionally set an Application-Setting in your Azure Web App to run a script before and / or after running the Middleman Build-Task:
 * PRE_DEPLOYMENT_ACTION - Command is called before Middleman Build-Task
 * POST_DEPLOYMENT_ACTION - Command is called after Middleman Build-Task
