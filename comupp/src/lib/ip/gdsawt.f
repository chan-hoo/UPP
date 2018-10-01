C-----------------------------------------------------------------------
      SUBROUTINE GDSAWT(KGDS,KB,KA,XPTS,YPTS,RLAT,RLON,AWT)
C$$$  SUBPROGRAM DOCUMENTATION BLOCK
C
C SUBPROGRAM:  GDSAWT     GRID DESCRIPTION SECTION AREA WEIGHTS
C   PRGMMR: IREDELL       ORG: W/NMC23       DATE: 96-04-10
C
C ABSTRACT: THIS SUBPROGRAM DECODES THE GRIB GRID DESCRIPTION SECTION
C           AND RETURNS THE EARTH'S AREA COVERED BY EACH GRID POINT.
C           THE GRID AND EARTH COORDINATES ARE ALSO RETURNED.
C           EDGE POINTS AND CORNER POINTS ARE GIVEN FULL WEIGHT NOW.
C
C PROGRAM HISTORY LOG:
C   96-04-10  IREDELL
C   97-10-20  IREDELL  MADE OBSOLESCENT BY GDSWZD
C
C USAGE:    CALL GDSAWT(KGDS,KB,KA,XPTS,YPTS,RLAT,RLON,AWT)
C
C   INPUT ARGUMENT LIST:
C     KGDS     - INTEGER (200) GDS PARAMETERS AS DECODED BY W3FI63
C     KB       - INTEGER MAXIMUM NUMBER OF COORDINATES
C
C   OUTPUT ARGUMENT LIST:
C     KA       - INTEGER NUMBER OF VALID POINTS COMPUTED
C     XPTS     - REAL (KB) GRID X POINT COORDINATES
C     YPTS     - REAL (KB) GRID Y POINT COORDINATES
C     RLON     - REAL (KB) EARTH LONGITUDES IN DEGREES
C     RLAT     - REAL (KB) EARTH LATITUDES IN DEGREES N
C     AWT      - REAL (KB) AREA WEIGHTS IN M**2
C
C SUBPROGRAMS CALLED:
C   GDSWZD       GRID DESCRIPTION SECTION WIZARD
C
C ATTRIBUTES:
C   LANGUAGE: FORTRAN 77
C
C$$$
      IMPLICIT NONE
      INTEGER KB, KA
      INTEGER KGDS(200)
      REAL XPTS(KB),YPTS(KB),RLAT(KB),RLON(KB),AWT(KB)
      REAL XLON(KB),XLAT(KB),YLON(KB),YLAT(KB)
      REAL CROT(KB),SROT(KB)
      REAL FILL
      FILL=-9999.
C - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      CALL GDSWZD(KGDS,0,KB,FILL,XPTS,YPTS,RLON,RLAT,KA,
     &            0,CROT,SROT,1,XLON,XLAT,YLON,YLAT,AWT)
C - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
      END