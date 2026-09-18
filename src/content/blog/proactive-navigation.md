---
title: "Case Study: From Reactive to Proactive Navigation"
description: "How research into a broken alternative route feature led to a proactive routing engine, a 4% gain in ETA prediction accuracy, and renewed user trust."
date: "October 24, 2025"
category: "Case Study"
tags: ["Case Study", "Navigation", "User Experience", "Product Strategy"]
heroImage: "/AltRoute.jpg"
heroAlt: "Navigation alternative route feature transformation"
featured: true
---

The most frustrating experience in navigation is being told you're on the "fastest route" while sitting in a sea of red taillights. This is a story about transforming a broken feature into a proactive co-pilot, rebuilding user trust by thinking ahead for the driver.

## 1. Context

- **Product:** A local mobile navigation app with a focus on real-time traffic avoidance.
- **My Role:** UX Researcher, then Product Manager for the Core Navigation Experience. I found the root cause as a researcher and led the solution as PM.
- **Team:** I led a cross-functional team of 1 UX Designer, 3 Engineers, and 1 Data Scientist, collaborating with our traffic data partners.
- **Business Goal:** Increase engagement with routing suggestions and improve user retention by delivering a more reliable and proactive navigation experience.

## 2. The Problem: A Feature That Made a Bad Situation Worse

Our "Alternative Route" feature was intended to be a driver's best friend, but our data and user feedback showed it was failing to meet its core promise. Two months of analysis revealed a feature that often added frustration instead of relief.

- **Low Engagement:** Less than *10%* of users who were presented with an alternative route ever engaged with it.
- **Poor Quality Suggestions:** Funnel analysis showed that the suggested routes offered minimal time savings (often less than 2-3 minutes) and were frequently just minor variations of the original path.
- **Unsafe User Experience:** The in-drive interface required multiple taps and significant visual attention to evaluate, creating a clear safety hazard.

The core issue was that the feature was reactive. It only offered help after a user was already caught in congestion. The sentiment from user feedback was overwhelmingly clear:

> "I don't need more options when I'm already stuck. I need an app that helps me avoid the traffic jam in the first place."

## 3. The Hypothesis

We hypothesized that if we could proactively suggest a single, high-confidence alternative route before a driver hits major congestion, then we would significantly increase feature adoption and user trust. The key was to shift from offering choices to providing a clear, intelligent recommendation.

## 4. The Research: Finding the 'Why'

To validate our hypothesis, we initiated a two-pronged research effort.

### Log Analysis

Working with our data scientist, we analyzed thousands of trips where users encountered major traffic. We discovered a clear pattern: the app would often detect the slowdown only when the user was already in it, at which point no alternative could offer a meaningful improvement.

### Field Research With Drivers

Alongside 300+ user interviews, I ran a real-world routing experiment with 5+ drivers across 20+ live sessions, combining what we saw in the car with traffic patterns, trip histories, and route selection data. The "aha!" moment came when we realized users didn't want to be route planners while driving. They felt anxious having to compare multiple options on a map and wanted the app to simply tell them the best way to go with confidence.

Our research confirmed it: users didn't want more choices; they wanted a smarter decision made for them.

## 5. The Solution: Predictive Routing & One-Tap Smart Suggestions

Based on our findings, we designed a two-part solution to create a truly proactive experience.

### The Proactive Routing Engine

We moved from a real-time reaction model to a predictive one. The new engine analyzes live traffic, historical congestion data, and even local event schedules to forecast major slowdowns up to **45 minutes** in advance. When it identifies a high-confidence delay, it automatically calculates a genuinely faster route.

### The "Smart Suggestion" UI

We completely redesigned the in-drive interface to be safe and seamless. Instead of a complex menu, a simple, non-intrusive banner appears at the bottom of the screen with a clear value proposition: *"Heavy traffic ahead. Save an estimated 12 minutes via Shiraz Ave. Tap to switch."* A single tap or simply waiting a few seconds reroutes the driver instantly. No distraction, no confusion.

## 6. The Results: Rebuilding Trust

We rolled out the new experience to all of our beta users (15% of our userbase) for over two weeks.

### Quantitative Impact

- **+4%** ETA prediction accuracy, from working closely with our data scientists to refine the traffic prediction model behind the Proactive Routing Engine.
- **5+ A/B experiments** on the navigation UI and recommendation modules validated the Smart Suggestion design and drove adoption before full rollout.

### Qualitative Impact

User sentiment saw a dramatic positive shift.

> "The new traffic alert saved me from being late to a client meeting. It felt like magic."

> "Finally, an app that thinks ahead! The one-tap route switch is brilliant and safer."

## 7. Reflections & Next Steps

This project reinforced that the best products don't just provide data; they provide peace of mind.

### Key Learnings

- **The Experience Is the Product:** Our initial failure was designing a tool that asked the user to do the hard work. By understanding the user's emotional state while driving (stressed, focused, and needing simplicity), we were able to design a feature that felt like an intelligent partner.
- **From Choice to Confidence:** In high-stakes environments like driving, overwhelming users with choices can be counterproductive. Providing a single, confident recommendation built far more trust than showing them three mediocre options.

### Next Steps

Our work was not done at this step. While we solved for proactive detours, our research showed users are still anxious about why they are being rerouted. Our next step was to explore adding contextual information to the suggestion, such as "Accident ahead" or "Heavy congestion," to give users even more confidence in the app's recommendations.

---

*This case study is from my time at Balad Maps. Want to know how I got from architecture to product management? [Read my full story](/story).*
