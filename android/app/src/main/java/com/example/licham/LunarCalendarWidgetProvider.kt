package com.example.licham

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.widget.RemoteViews
import android.app.PendingIntent
import android.content.Intent

class LunarCalendarWidgetProvider : AppWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        for (appWidgetId in appWidgetIds) {
            val widgetData = es.antonborri.home_widget.HomeWidgetPlugin.getData(context)
            val views = RemoteViews(context.packageName, R.layout.lunar_calendar_widget)

            // Set up click intent
            val intent = context.packageManager.getLaunchIntentForPackage(context.packageName)
            val pendingIntent = PendingIntent.getActivity(
                context,
                0,
                intent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
            views.setOnClickPendingIntent(R.id.widget_layout, pendingIntent)

            // Get solar date components
            val solarDate = widgetData.getString("solar_date", "...") ?: "..."
            if (solarDate != "...") {
                val solarParts = solarDate.split("/").takeIf { it.size == 3 }
                if (solarParts != null) {
                    views.setTextViewText(R.id.solar_day, solarParts[0])
                    views.setTextViewText(R.id.solar_month_year, "Tháng ${solarParts[1]}, ${solarParts[2]}")
                } else {
                    views.setTextViewText(R.id.solar_day, "...")
                    views.setTextViewText(R.id.solar_month_year, "...")
                }
            } else {
                views.setTextViewText(R.id.solar_day, "...")
                views.setTextViewText(R.id.solar_month_year, "...")
            }

            // Get lunar date
            val lunarDate = widgetData.getString("lunar_date", "...") ?: "..."
            views.setTextViewText(R.id.lunar_date, lunarDate)

            // Get note
            val note = widgetData.getString("note", "") ?: ""
            views.setTextViewText(R.id.note, note)

            // Update widget
            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }
} 