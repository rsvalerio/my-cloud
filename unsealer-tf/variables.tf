variable "image" {
  type        = string
  description = "docker image"
}

# optionals
variable "app" {
  default     = ""
  description = "(String) fly app"
}
variable "cmd" {
  default     = ""
  description = "(List of String) cmd"
}
variable "cpus" {
  default     = ""
  description = "(Number) cpu count"
}
variable "cputype" {
  default     = ""
  description = "(String) cpu type"
}
variable "entrypoint" {
  default     = ""
  description = "(List of String) image entrypoint"
}
variable "env" {
  default     = ""
  description = "(Map of String) Optional environment variables, keys and values must be strings"
}
variable "exec" {
  default     = ""
  description = "(List of String) exec command"
}
variable "memorymb" {
  default     = ""
  description = "(Number) memory mb"
}
variable "mounts" {
  default     = ""
  description = "(Attributes List) Volume mounts (see below for nested schema)"
}
variable "services" {
  description = "(Attributes List) services (see below for nested schema)"
}
variable "regions" {
  description = "(Attributes List) regions to create machines"
}
