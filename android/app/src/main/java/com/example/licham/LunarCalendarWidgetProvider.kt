package com.example.licham

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.widget.RemoteViews
import android.app.PendingIntent
import android.content.Intent

class LunarCalendarWidgetProvider : AppWidgetProvider() {
    private fun getMonthInVietnamese(month: Int): String {
        return when (month) {
            1 -> "Một"
            2 -> "Hai"
            3 -> "Ba"
            4 -> "Bốn"
            5 -> "Năm"
            6 -> "Sáu"
            7 -> "Bảy"
            8 -> "Tám"
            9 -> "Chín"
            10 -> "Mười"
            11 -> "Mười Một"
            12 -> "Mười Hai"
            else -> month.toString()
        }
    }

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
                    val monthInText = getMonthInVietnamese(solarParts[1].toInt())
                    views.setTextViewText(R.id.solar_month_year, "Tháng ${monthInText}")
                } else {
                    views.setTextViewText(R.id.solar_day, "...")
                    views.setTextViewText(R.id.solar_month_year, "...")
                }
            } else {
                views.setTextViewText(R.id.solar_day, "...")
                views.setTextViewText(R.id.solar_month_year, "...")
            }

            // Get lunar date components
            val lunarDay = widgetData.getString("lunar_day", "") ?: ""
            val lunarMonth = widgetData.getString("lunar_month", "") ?: ""
            val lunarYear = widgetData.getString("lunar_year", "") ?: ""
            val lunarYearName = widgetData.getString("lunar_year_name", "") ?: ""
            
            // Format lunar date as "AL: DD-MM Năm"
            if (lunarDay.isNotEmpty() && lunarMonth.isNotEmpty() && lunarYearName.isNotEmpty()) {
                views.setTextViewText(R.id.lunar_date, "AL: $lunarDay-$lunarMonth $lunarYearName")
            } else {
                views.setTextViewText(R.id.lunar_date, "...")
            }

            // Update widget
            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }
} 