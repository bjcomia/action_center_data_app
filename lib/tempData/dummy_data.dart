import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

const tempData = [
  {"title": "BatStateU Action Center",
    "subTitle": "Batangas State University – The National Engineering University, Adaptive Capacity-building and Technology Innovation for Occupational Hazards and Natural Disasters or BatStateU ACTION Center is our hub for disaster response, training, and research. Since 2016, we've been at the forefront of enhancing disaster risk management and fostering resilient communities. We are dedicated innovation and leading the way for disaster risk reduction and climate change adaptation. BatStateU ACTION Center operates under the Office of the University President in collaboration with partner Local Government Units (LGUs), Regional Line Agencies (RLAs) and private organizations in the local, national and international levels.",
    "imageUrl": "images/Article1.png"},
  {"title": "Be Informed, Stay Safe!",
    "subTitle": "In times of disaster, whether it’s a fire, flood, or electrical hazard, being prepared and informed can save lives. For fires, it’s crucial to know your evacuation routes and have a fire extinguisher readily accessible. During floods, avoid walking or driving through floodwaters, and seek higher ground immediately. For electrical hazards, always assume downed power lines are live and report them to authorities without attempting to move them yourself.\n \n "
     "Vehicular incidents require prompt and cautious responses to ensure safety. Always carry a first aid kit in your vehicle and know basic medical procedures for injuries. In the event of a medical emergency, call emergency services immediately and provide clear information about the situation. For security threats, stay vigilant, be aware of your surroundings, and report any suspicious activities to the appropriate authorities. Following these advisories can significantly enhance your safety and preparedness during unexpected events.",
    "imageUrl": "images/Article2.png"},
  {"title": "Weather Update",
    "subTitle": "Cloudy to overcast conditions with a low chance (28%) of light rain (3.6 mm) are expected over Batangas State University in the next 24 hours. Temperatures will range from 27 to 31°C, with heat index values between 31 and 38°C. Wind speeds are anticipated to vary from 10 to 30 kph during this period. \n \n"
     "#CarinaPH. \n"
     "#WeatherUpdate \n"
     "#BatStateUTNEU \n"
     "#staysafe #klimahq"
    ,"imageUrl": "images/Article3.png"},
  {"title": "Bomb Threat Preparedness and Response", "subTitle": "We're excited to announce a crucial and timely virtual forum focusing on Bomb Threat Preparedness and Response. In an ever-changing world, being prepared for any potential threat is essential for ensuring safety and security. This forum is designed to equip you with the knowledge and strategies needed to effectively respond to bomb threats, enhancing your readiness and resilience. \n \n"
    "🗓️ Date: July 24-25, 2024 \n"
    "🕒 Time: 8:00-11:00 AM PHST \n"
    , "imageUrl": "images/Article4.png"},
];

const incidentTypes = [
  "Fire",
  "Electrical Hazards",
  "Flood",
  "Vehicular Incidents",
  "Medical Emergencies",
  "Security Threats",
  "Others"
];

const notifications = [
  {
    "title": "Incident Reported",
    "content": "Your report has been successfully submitted to the Incident Management Team (IMT) and will be reviewed shortly.",
    "icon": Ionicons.checkmark_circle,
    "color" : Colors.green
  },
  {
    "title": "Incident being Processed",
    "content": "Your reported incident is now being processed by IMT and are actively assessing the situation.",
    "icon": Ionicons.checkbox,
    "color" : Colors.yellow

  },
  {
    "title": "Incident Responded",
    "content": "Your reported incident has been addressed. The authorities have been notified and are on their way to the location.",
    "icon": Ionicons.shield_checkmark,
    "color" : Colors.blue
  }
];