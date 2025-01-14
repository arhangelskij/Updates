//
//  Services.swift
//  Updates
//
//  Created by Ross Butler on 12/04/2020.
//

import Foundation

struct Services {
    
    static func appMetadata(bundleIdentifier: String, countryCode: String) -> AppMetadataService? {
        return ITunesSearchAPIService(bundleIdentifier: bundleIdentifier, countryCode: countryCode)
    }
    
    static func configuration(configurationURL: URL, cachedConfigurationURL: URL) -> ConfigurationService {
        return DefaultConfigurationService(
            configurationURL: configurationURL,
            cachedConfigurationURL: cachedConfigurationURL
        )
    }
    
    static func updateResolutionService(appMetadataService: AppMetadataService? = nil, bundleVersion: String,
                                        configuration: ConfigurationResult, operatingSystemVersion: String,
                                        strategy: UpdatingMode) -> UpdateResolutionService {
        return StrategicUpdateResolutionService(
            appMetadataService: appMetadataService,
            bundleVersion: bundleVersion,
            configuration: configuration,
            operatingSystemVersion: operatingSystemVersion,
            strategy: strategy
        )
    }
    
    static func versionJournallingService() -> VersionJournalingService {
        return DefaultVersionJournalingService()
    }
    
}
