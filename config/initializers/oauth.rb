Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '162245213893.apps.googleusercontent.com','lAZVxXOne5baMuCFlCjizug-'
  #provider :google_oauth2,
    #'561310815004-r0sgos4n9dq18ocau699ffuabegvdcor.apps.googleusercontent.com',
    #'FgwJnkxolJXFLDnPWSKzJFt2'
end
