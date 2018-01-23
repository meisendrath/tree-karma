Paperclip.options[:command_path] = '/usr/local/bin/'

Paperclip::Attachment.default_options.update(
  storage: :s3,
  s3_region: Rails.application.secrets.aws_region,
  s3_credentials: {
    bucket: Rails.application.secrets.aws_s3_bucket,
    access_key_id: Rails.application.secrets.aws_access_key_id,
    secret_access_key: Rails.application.secrets.aws_secret_access_key,
    s3_host_name: Rails.application.secrets.aws_s3_host_name
  }
)
