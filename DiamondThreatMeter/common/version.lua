local activeModule = "Version";

-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-- @ Version History                            ( X.Y.ZZ : X > Major ; Y > Minor ; ZZ > Revision )
-- @ -------------------------------------------------------------------------------------------------------------------------------------------------------
-- @
-- @ See Version History.txt in docs folder.
-- @
-- @ Version Convention
-- @ -------------------------------------------------------------------------------------------------------------------------------------------------------
-- @ Major:
-- @   When a complete revamp of DTM system is performed, the major increases by 1 and minor/revision are reset to 0.
-- @   A test version of DTM should always have a major of 0.
-- @   The original DiamondThreatMeter should have a major of 1.
-- @   Systems with different majors are immediately incompatible.
-- @
-- @ Minor:
-- @   Increases when a new functionality is added in DTM. This causes revisions to reset back to 0.
-- @   Systems with different minors are sometimes incompatible.
-- @
-- @ Revision:
-- @   When minor changes/bugfixes to DTM are performed, the revision number should increase by 1, until we have to increase the minor or major by 1,
-- @   in which case the revision number resets back to 0.
-- @   Generally, revision number has no effect on compatibility.
-- @
-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

local DTM_Version_String = "6.0.3";
local DTM_Version_Major = 5;
local DTM_Version_Minor = 0;
local DTM_Version_Revision = 5;

-- --------------------------------------------------------------------
-- **                       Version functions                        **
-- --------------------------------------------------------------------

-- ********************************************************************
-- * DTM_GetVersion()                                                 *
-- ********************************************************************
-- * Arguments:                                                       *
-- *  <none>                                                          *
-- ********************************************************************
-- * Returns the major, minor & revision data relevant to our version.*
-- ********************************************************************

function DTM_GetVersion()
    return DTM_Version_Major, DTM_Version_Minor, DTM_Version_Revision;
end

-- ********************************************************************
-- * DTM_GetVersionString()                                           *
-- ********************************************************************
-- * Arguments:                                                       *
-- *  <none>                                                          *
-- ********************************************************************
-- * Returns the version DTM is made for.                             *
-- ********************************************************************

function DTM_GetVersionString()
    return DTM_Version_String;
end

-- The following APIs were taken from one of my other projects, but it's probably unnecessary for DTM itself.

-- ********************************************************************
-- * DTM_IsCompatible(major, minor, revision)                         *
-- ********************************************************************
-- * Arguments:                                                       *
-- * major, minor, revision >> the version of the remote DTM system.  *
-- ********************************************************************
-- * Returns nil if we can't cooperate with remote DTM system.        *
-- * Returns 1 if we can.                                             *
-- ********************************************************************

function DTM_IsCompatible(major, minor, revision)
    local oMajor, oMinor, oRevision = DTM_GetVersion();
    if ( major ~= oMajor ) then return nil; end
    if ( minor ~= oMinor ) then return nil; end
    return 1;
end

-- ********************************************************************
-- * DTM_CompareRemoteVersion(major, minor, revision)                 *
-- ********************************************************************
-- * Arguments:                                                       *
-- * major, minor, revision >> the version of the remote DTM system.  *
-- ********************************************************************
-- * Returns 0 if the remote system version is older than ours.       *
-- * Returns 1 if remote system version = ours.                       *
-- * Returns 2 if the remove system version is newer than ours.       *
-- ********************************************************************

function DTM_CompareRemoteVersion(major, minor, revision)
    local oMajor, oMinor, oRevision = DTM_GetVersion();
    if ( major < oMajor ) then return 0; end
    if ( major > oMajor ) then return 2; end
    if ( minor < oMinor ) then return 0; end
    if ( minor > oMinor ) then return 2; end
    if ( revision < oRevision ) then return 0; end
    if ( revision > oRevision ) then return 2; end
    return 1;
end
