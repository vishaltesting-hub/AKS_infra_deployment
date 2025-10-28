variable "rg" {
    description = "A map of resource group configurations."
    type = map(object({
        name     = string
        location = string
        tags     = map(string)
    }))
  
}