package com.example.myapplication

import com.google.android.gms.ads.AdRequest
import com.google.android.gms.ads.AdView

import androidx.fragment.app.Fragment

import android.os.Bundle
import android.view.LayoutInflater
import android.view.ViewGroup
import android.view.View
import android.widget.Toast
import com.example.myapplication.databinding.FragmentAdMobBinding

class AdMobFragment : Fragment() {

    private var _binding: FragmentAdMobBinding? = null

    // This property is only valid between onCreateView and
    // onDestroyView.
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {

        _binding = FragmentAdMobBinding.inflate(inflater, container, false)
        return binding.root

    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        // Load an ad into the AdMob banner view.
        val adView: AdView = binding.adView
        val adRequest = AdRequest.Builder()
            .setRequestAgent("android_studio:ad_template").build()
        adView.loadAd(adRequest)
    }

    override fun onActivityCreated(savedInstanceState: Bundle?) {
        super.onActivityCreated(savedInstanceState)
        val appContext = activity?.applicationContext ?: return
        Toast.makeText(appContext, TOAST_TEXT, Toast.LENGTH_LONG).show()
    }

    companion object {
        // Remove the below line after defining your own ad unit ID.
        private const val TOAST_TEXT =
            "Test ads are being shown. " + "To show live ads, replace the ad unit ID in res/values/strings.xml with your own ad unit ID."
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}