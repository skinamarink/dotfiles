options(repos=c("http://cran.cnr.Berkeley.edu","http://cran.stat.ucla.edu"))

if(interactive()){
       # Suggested libraries:
       library(colorout)
       library(setwidth)

       # Use text based web browser to navigate through R docs after help.start():
       if(Sys.getenv("NVIMR_TMPDIR") != "")
           options(browser = function(u) .C("nvimcom_msg_to_nvim",
                                            paste0('StartTxtBrowser("w3m", "', u, '")')))
}
