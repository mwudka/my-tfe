//--------------------------------------------------------------------
// Modules
module "animal" {
  source  = "tfe-zone-60f6da41.ngrok.io/otherorg/animal/demo"
  version = "1.0.0"

  name = "testing"
}