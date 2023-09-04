import 'package:flutter/material.dart';


Map<String, Map<String, List<String>>> muscleGroups = {
  "Abs": {
    "Abdominals":["Crunches", "Sit-Ups"],
  },
  "Arms": {
    "Biceps": ["Bicep Curls", "Hammer Curls", "Preacher Curls"],
    "Triceps": ["Tricep Extensions", "Close-Grip Bench Press", "Overhead Triceps Extensions"],
    "Forearms": ["Wrist Curls", "Reverse Wrist Curls", "Plate Pinches"]
  },
  "Back": {
    "Lats": ["Pull-ups", "Dumbbell Rows", "Pulldowns"],
    "Lower Back": ["Deadlifts", "Good Mornings", "Hyperextensions"],
    "Traps": ["Barbell Shrugs", "Dumbbell Shrugs", "Cable Shrugs"],
    "Upper Back": ["Face Pulls", "Band Pull-Aparts", "Rows"]
  },
  "Chest": {
    "Pectoralis Major": ["Bench Press", "Incline Bench Press", "Decline Bench Press"],
    "Pectoralis Minor": ["Flyes", "Cable Crossovers", "Chest Dips"]
  },
  "Legs": {
    "Quadriceps": ["Squats", "Leg Press", "Leg Extensions"],
    "Hamstrings": ["Deadlifts", "Romanian Deadlifts", "Hamstring Curls"],
    "Calves": ["Calf Raises", "Seated Calf Raises", "Standing Calf Raises"],
    "Glutes": ["Hip Thrusts", "Glute Bridges", "Squats"]
  },
  "Shoulders": {
    "Front Deltoids": ["Overhead Press", "Front Raises", "Lateral Raises"],
    "Side Deltoids": ["Lateral Raises", "Lateral Raises to Front", "Face Pulls"],
    "Rear Deltoids": ["Rear Delt Flyes", "Face Pulls", "Reverse Flyes"]
  },
};