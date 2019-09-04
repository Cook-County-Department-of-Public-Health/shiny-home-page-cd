library(shiny)
flu_link = "https://ccdphcd.shinyapps.io/weekly_influenza_surveillance_beta/"
equity_link = "https://ccdphcd.shinyapps.io/healthequity/"
wnv_link = "https://ccdphcd.shinyapps.io/westnile/"
vaccines_link = "https://ccdphcd.shinyapps.io/schoolvaccines/"
cd_link = "https://ccdphcd.shinyapps.io/cd-surveillance/"

ui <- fluidPage(
  #Bring in extra CSS to style application
  includeCSS("app.css"),

  #Add Google analytics global tracking code
  tags$head(HTML('<script async src="https://www.googletagmanager.com/gtag/js?id=UA-131221855-5"></script>')),
  tags$head(tags$script(HTML(" window.dataLayer = window.dataLayer || [];
                             function gtag(){dataLayer.push(arguments);}
                             gtag('js', new Date());
                             gtag('config', 'UA-131221855-5')"))),
  
  #Building the header 
  # spacing isn't quite right, but works better on small screen
  # fluidRow(style= "border-bottom: 6px solid #6E9DC9",
  #          column(class = "headimg", 2, align = "center", img(class = "imggen", src="http://cookcountypublichealth.org/files/images/CCDPH_logo-full.jpg", alt="CCDPH Logo")), 
  #          column( 10, HTML('<h1 style="font-weight: 700; font-size: 35px;letter-spacing: .04em;">Cook County Department of Public Health Interactive Data Apps</h1>
  #                                               '))
  # ),
  fluidRow(class = "header",
           column(class = "headimg", 2, align = "center", img(class = "imggen", src="https://www.cookcountypublichealth.org/wp-content/uploads/2018/12/CookCountyLogo.png", alt="CCDPH Logo")), 
           column(class = "headtitle", 10, HTML('
                                                <h1 style="font-weight: 700; font-size: 35px">Cook County Department of Public Health Interactive Data Apps</h1>
                                                '))
           ),
  br(),
  #Description
  fluidRow(
    column(
      width = 12,
      HTML('<p style = "padding-bottom:20px;padding-top:20px;padding-left:60px;padding-right:60px;text-align: center; background:#EAF5FF;border: 3px solid #D5E2EF;font-size: 15px;font-weight:500;font-size:16px">In an effort to make accessing heath data more flexible and user-friendly, the Cook County Department of Public Health Communicable Disease Unit has created a series of interactive data visualization applications (apps). 
        Explore the links below to learn more about local health indicators in suburban Cook County!</p>')
      )
  ),
  br(),
  
  #Surveillance App
  fluidRow(
    column( #button
      width = 2, offset = 0, align = "center",  actionButton("cd", "", icon = icon("chart-line"),  onclick ="window.open('https://ccdphcd.shinyapps.io/cd-surveillance/', '_blank')")
    ),
    column( #description
      width = 8, offset = 0, 
      a(h3("Communicable Disease Surveillance"), href = cd_link, target="_blank"),
      p("The Cook County Department of Public Health (CCDPH) continuously collects data on communicable diseases in order to better understand their burden in our community, detect outbreaks, and prevent further infections. This app allows users to explore some of this surveillance data for select communicable diseases and outbreaks that CCDPH has investigated.")
    )
  ),br(), hr(),
  
  #Equity App
  fluidRow(
    column( #button
      width = 2, offset = 0, align = "center",  actionButton("equity", "", icon = icon("users"),  onclick ="window.open('https://ccdphcd.shinyapps.io/healthequity/', '_blank')")
    ),
    column( #description
      width = 8, offset = 0, 
      a(h3("Communicable Diseases & Health Equity"), href = equity_link, target="_blank"),
      p("Suburban Cook County has some of the most affluent, as well as some of the most disadvantaged, municipalities in the country. We see these disparities manifested in various health outcomes in our cities, villages, and towns. Cook County Department of Public Health has made addressing health equity one of its top priorities in its Community Health Assessment and Improvement Plan, WePlan2020. With this app, we allow for the visualization of select infectious disease rates in suburban Cook County and their correlations with various social indicators related to income, education, insurance status, place of birth, race, and ethnicity.")
    )
  ),br(), hr(),
  
  #Vaccines App
  fluidRow(
    column( #button
      width = 2, offset = 0, align = "center",  actionButton("vaccines", "", icon = icon("school"),  onclick ="window.open('https://ccdphcd.shinyapps.io/schoolvaccines/', '_blank')")
    ),
    column( #description
      width = 8, offset = 0, 
      a(h3("School Vaccination Data"), href = vaccines_link, target="_blank"),
      p("This app allows you to explore vaccination (or immunization) rates at 
        schools in suburban Cook County. Users can check out trends in vaccination rates over the last five years, 
        see a map of vaccination data for the last school
        year, and find data for a specific school or district.")
    )
  ),br(), hr(),
  
  #Flu App
  fluidRow(
    column( #button
      width = 2, offset = 0,  align = "center", actionButton("flu", "", icon = icon("syringe"), onclick ="window.open('https://ccdphcd.shinyapps.io/weekly_influenza_surveillance_beta/', '_blank')")
  ),
    column( #description
      width = 8, offset = 0, 
           a(h3("Weekly Influenza Surveillance"), href = flu_link, target="_blank"),
           p("The Cook County Department of Public Health collects and analyzes data on local influenza activity year-round. During periods when higher influenza activity is expected (from early October through mid-May), this information is compiled into a weekly surveillance report that is distributed to our partners in the healthcare community, schools, community groups, and the public. This application is a companion to our weekly surveillance report.")
           )
  ), br(), hr(),
  
  #WNV App
  fluidRow(
    column( #button
      width = 2, offset = 0, align = "center",  actionButton("wnv", "", icon = icon("crow"), onclick ="window.open('https://ccdphcd.shinyapps.io/westnile/', '_blank')")
    ),
    column( #descriptoin
      width = 8, offset = 0, 
      a(h3("Weekly West Nile Virus Surveillance"), href = wnv_link, target="_blank"),
      p("During periods when increased West Nile virus activity is expected (generally from June through October), 
        suburban Cook County's four mosquito abatement districts (MADs)- the North Shore MAD, the Northwest MAD,
        the Desplaines Valley MAD, and the South Cook County MAD- and the Cook County Department of Public Health 
        and the Illinois Department of Public Health, trap and test mosquitos for West Nile virus. The Cook County 
        Department of Public Health also tests dead birds for West Nile virus and conducts disease surveillance in humans. 
        Surveillance data is compiled into a weekly report and shared with our partners in mosquito control, the healthcare 
        community, and the public. This application is a companion to our weekly report.")
    )
  ), 

  br(), br(),  br(), 
  #set tab name
  titlePanel("",windowTitle = "Cook County Interactive Data")
  
)

server <- function(input, output, session) {

}

shinyApp(ui, server)
