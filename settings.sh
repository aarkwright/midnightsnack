# Needed Settings

    # Log file location - needs to be defined first
    LogFileLoc="/home/builder/android/system/logs"

    SourceTreeLoc="/home/builder/android/system"
    DeviceList=(
                  "oneplus3"
                                    )

    # In Settings, Version: 14.1-20161225-UNOFFICIAL-angler
    #   RomVersion is '14.1'
    #   Device is 'angler'
    # In Settings, Build Number: cm_angler-userdebug
    #   RomVariant is 'cm'
    #   RomBuildType is 'userdebug'
    #   Device is 'angler'
    RomVariant="lineage"
    RomBuildType="userdebug"
    RomVersion="14.1"

    # Jack eats RAM
    JackRAM="8g"

    # Can run make clean before building OR before building + between each device build
    # Can be "Disabled", "BetweenBuilds" or "AtStart"
    MakeClean="BetweenBuilds"


# Optionals
    # Set Zip file name to tomorrow's date (date at start of script + 24 hours)
    BuildTomorrow=false
    # Stop script on non-breaking changes
    StopOnWarn=false
    # Sync repo before building
    SyncOnStart=true
    # Use ccache: the superfast cache of previously built files
    UseCcache=true
    DeleteBuildAfterUpload=true
    # If you'd like to pick some specific unmerged changes from Gerrit after a repo sync, here's your chance:
    # RepoPicks is an array so use it in the form below: (Like DeviceList)
    #RepoPicks=( "" )
    # If you'd like to pick an entire topic to pull from Gerrit after a repo sync: (same format as RepoPicks and DeviceList)
    #RepoTopics=( "rebrand" )

    # Override threads for building. This is set to CPU core count by default
    # If this is too low (<3), you may run into weird problems like:
    # javac: file not found: out/target/common/obj/APPS/org.cyanogenmod.platform-res_intermediates/src/cyanogenmod/platform/Manifest.java
    MakeThreadCount=4



# SSH Upload
    SSHUpload=false #Therefore define the parameters
      SSHHost=lineage
      SSHUser=builder
      SSHPort=22
      SSHDirectory=/home/builder/public_html/lineageos/downloads
