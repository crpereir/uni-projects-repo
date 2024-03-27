package pt.isel.gomoku.ui.about

import android.app.Activity
import android.content.ActivityNotFoundException
import android.content.ContentValues.TAG
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.util.Log
import android.widget.Toast
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import pt.isel.gomoku.R
import pt.isel.gomoku.domain.about.Author

/**
 * The application's about activity, used to display information about the application's authors.
 * Navigation to this activity is done through the [AboutActivity.navigateTo] method.
 */
class AboutActivity : ComponentActivity() {

    companion object {
        fun navigateTo(origin: Activity) {
            val intent = Intent(origin, AboutActivity::class.java)
            origin.startActivity(intent)
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            AboutScreen(
                authors = authors,
                onBackRequested = { finish() },
                onSendEmailRequested = { openSendEmail() },
            )
        }
    }

    private fun openSendEmail() {
        try {
            val intent = Intent(Intent.ACTION_SENDTO).apply {
                data = Uri.parse("mailto:")
                putExtra(Intent.EXTRA_EMAIL, authors.map { a: Author -> a.email }.toTypedArray())
                putExtra(Intent.EXTRA_SUBJECT, SUBJECT_EMAIL_AUTHORS)
            }

            startActivity(intent)
        } catch (e: ActivityNotFoundException) {
            Log.e(TAG, "[INFO] Failed to send email", e)
            Toast
                .makeText(
                    this,
                    R.string.activity_info_no_suitable_app,
                    Toast.LENGTH_LONG
                )
                .show()
        }
    }
}

/**
 * Static information about application's [Author]s.
 */
private val authors = listOf(
    Author("João Bonacho    ", "49437", "a49437@alunos.isel.pt"),
    Author("Carolina Pereira", "49470", "a49470@alunos.isel.pt"),
    Author("André Gonçalves", "49464", "a49464@alunos.isel.pt")
)
private const val SUBJECT_EMAIL_AUTHORS = "ISEL-LEIC-PDM Gomoku Application"
