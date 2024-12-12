library(shiny)
equity_link = "https://ccdphcd.shinyapps.io/healthequity/"
wnv_link = "https://ccdphcd.shinyapps.io/westnile/"
vaccines_link = "https://ccdphcd.shinyapps.io/schoolvaccines/"
cd_link = "https://ccdphcd.shinyapps.io/cd-surveillance/"
opioid_link = "https://ccdphcd.shinyapps.io/opioid-overdose/"
respiratory_link = "https://ccdphcd.shinyapps.io/respiratory/"

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
           column(class = "headimg", 3, align = "center", img(class = "imggen", src="https://cookcountypublichealth.org/wp-content/uploads/2024/02/CCDPH_BHC_FullColor_Primary-3.png", alt="CCDPH Logo")), 
           column(class = "headtitle", 9, HTML('
                                                <h1 style="font-weight: 700; font-size: 35px">CCDPH Interactive Data Apps</h1>
                                                '))
           ),
  br(),
  #Description
  fluidRow(
    column(
      width = 12,
      HTML('<p style = "padding-bottom:20px;padding-top:20px;padding-left:60px;padding-right:60px;text-align: center; background:#EAF5FF;border: 3px solid #D5E2EF;font-size: 15px;font-weight:500;font-size:16px">In an effort to make accessing heath data more flexible and user-friendly, the Cook County Department of Public Health has created a series of interactive data visualization applications on topics of special interest. 
        Explore the links below for a deep dive into local health indicators in suburban Cook County.</p>')
      )
  ),
  br(),
  
  
  # #Surveillance App
  # fluidRow(
  #   column( #button
  #     width = 2, offset = 0, align = "center",  actionButton("cd", "", icon = icon("chart-line"),  onclick ="window.open('https://ccdphcd.shinyapps.io/cd-surveillance/', '_blank')")
  #   ),
  #   column( #description
  #     width = 8, offset = 0, 
  #     a(h3("Communicable Disease Surveillance"), href = cd_link, target="_blank"),
  #     p("The Cook County Department of Public Health (CCDPH) continuously collects data on communicable diseases in order to better understand their burden in our community, detect outbreaks, and prevent further infections. This app allows users to explore some of this surveillance data for select communicable diseases and outbreaks that CCDPH has investigated.")
  #   )
  # ),br(), hr(),
  # 
  # 
  # #Equity App
  # fluidRow(
  #   column( #button
  #     width = 2, offset = 0, align = "center",  actionButton("equity", "", icon = icon("users"),  onclick ="window.open('https://ccdphcd.shinyapps.io/healthequity/', '_blank')")
  #   ),
  #   column( #description
  #     width = 8, offset = 0, 
  #     a(h3("Communicable Diseases & Health Equity"), href = equity_link, target="_blank"),
  #     p("Suburban Cook County has some of the most affluent, as well as some of the most disadvantaged, municipalities in the country. We see these disparities manifested in various health outcomes in our cities, villages, and towns. Cook County Department of Public Health has made addressing health equity one of its top priorities in its Community Health Assessment and Improvement Plan, WePlan2020. With this app, we allow for the visualization of select infectious disease rates in suburban Cook County and their correlations with various social indicators related to income, education, insurance status, place of birth, race, and ethnicity.")
  #   )
  # ),br(), hr(),
  
  #Opioid App
  fluidRow(
    column( #button
      width = 2, offset = 0, align = "center",
      actionButton("overdoses", "", icon = icon("chart-bar"),
                   onclick =paste0("window.open('",opioid_link,"', '_blank')")
                   )
    ),
    column( #description
      width = 8, offset = 0,
      a(h3("Opioid-Involved Overdoses"), href = opioid_link, target="_blank"),
      p("The CCDPH Opioid-Involved Overdose app presents opioid-involved mortality for users to better understand the effects of the opioid epidemic within Suburban Cook County. The app uses mortality data from the Office of the ",
        a("Medical Examiner of Cook County.", href = "https://datacatalog.cookcountyil.gov/Public-Safety/Medical-Examiner-Case-Archive/cjeq-bs86", target="_blank"),
        " For more information on how you can help prevent opioid-involved overdose death, please visit the ",
        a("CCDPH Opioid page.", href = "https://cookcountypublichealth.org/behavioral-health/opioids/", target="_blank"))
    )
  ),br(), hr(),
  
  
  #Respiratory App
  fluidRow(
    column( #button
      width = 2, offset = 0, align = "center",
      actionButton("respiratory", "", icon = icon("hospital"),  #syringe also an option for icon
                   onclick =paste0("window.open('",respiratory_link,"', '_blank')")
                   )
    ),
    column( #description
      width = 8, offset = 0,
      a(h3("Respiratory Virus Surveillance"), href = respiratory_link, target="_blank"),
      p("This dashboard provides a pan-respiratory overview containing suburban Cook County data on COVID-19, flu, and RSV. ")
    )
  ),br(), hr(),

  #Vaccines App
  fluidRow(
    column( #button
      width = 2, offset = 0, align = "center",
      actionButton("vaccines", "", icon = icon("school"),
                   onclick =paste0("window.open('",vaccines_link,"', '_blank')")
      )
    ),
    column( #description
      width = 8, offset = 0,
      a(h3("School Vaccination Data"), href = vaccines_link, target="_blank"),
      p("This app allows you to explore vaccination rates at
        schools in suburban Cook County. Users can check out trends in vaccination rates over the last five years,
        see a map of vaccination data for the last school
        year, and find data for a specific school or district.")
    )
  ),br(), hr(),
  
  
  #WNV App
  fluidRow(
    column( #button
      width = 2, offset = 0, align = "center",
      actionButton("wnv", "", icon = icon("crow"),
                   onclick =paste0("window.open('",wnv_link,"', '_blank')")
      )
    ),
    column( #descriptoin
      width = 8, offset = 0,
      a(h3("West Nile Virus Surveillance"), href = wnv_link, target="_blank"),
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
