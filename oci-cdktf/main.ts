// Copyright (c) HashiCorp, Inc
// SPDX-License-Identifier: MPL-2.0
import { Construct } from "constructs";
import { App, TerraformStack, CloudBackend, NamedCloudWorkspace } from "cdktf";
import { OciProvider } from './.gen/providers/oci/provider'

class MyStack extends TerraformStack {
  constructor(scope: Construct, id: string) {
    super(scope, id);

    // define resources here
        new OciProvider(this, 'main', {})

        id = Identi
  }
}

const app = new App();
const stack = new MyStack(app, "oci");
new CloudBackend(stack, {
  hostname: "app.terraform.io",
  organization: "my-cloud-org",
  workspaces: new NamedCloudWorkspace("oci")
});
app.synth();
