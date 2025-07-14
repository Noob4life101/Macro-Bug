; #Include <FindText>

t1:=A_TickCount, Text:=X:=Y:=""

EggShopText:="|<>FEFEFE-323232$160.D400000000008000zU0003l0001yM000000000EU003y0000zY000A9U000000001W0008000036E000k6kQ000iMC0DBUs0U1wD0A1g73tUTXsaE7zlw1wy7k3yDlw0s7kyTVlmMmN0QnAs134n0DkX8E0wMa9X1a9XDs1X4y04AHs0U6AV00NWEq42MaAzU6AHU0EVC020Mm401Y92MwNWMla0MlCE124s081b8k36EaNXT68y4M1X4T048Fw0zXwz0Dl2DbssEVUF06AEs0EV3U3y7lw0C48MT00000000000000000061U00001U000000000000000003sS00000600000000000000000071k00000M8"

if (ok:=FindText(&X, &Y, 1115-150000, 503-150000, 1115+150000, 503+150000, 0, 0, Text))
{
  ; FindText().Click(X, Y, "L")
}
SummerText:="|<>FFFFFF-323232$192.00TU000000000000000000000000000007zy00000000000000000000000000000TzzU0000000000000000000000000001zzzk0000000000000000000000000003zzzs0000000000000000000000000003zzzw0000000000000000000000000007zzzw0000000000000000000000000007z0Dy000000000000000000000000000Dw07y000000000000000000000000000Dw03y03U0A001w07U0007k0S0001w003Dw03y0z07w0D7zUzs00wTy3zU00DzU0TDw03y0z07w1zTznzy07xzzDzs00zzk0TDw07k1z07w1zzzzzy07zzzzzs01zzw0T7z0001z07w1zzzzzz07zzzzzw03zzw0T7zk001z07w1zzzzzz07zzzzzw07zzy0T3zy001z07w1zzzzzzU7zzzzzy0Dzzz0T3zzk01z07w1zyDzkzU7zszz3y0Dy3z0T1zzw01z07w1zw7zUzU7zkTy3y0Ts3zUT0zzz01z07w1zs7z0zU7zUTw3y0TkDzUT0DzzU1z07w1zk7y0TU7z0Ts1y0TkzzkT03zzk1y07w1zU7y0TU7y0Ts1y0zVzz0T00Tzs1y07w1zU7w0TU7y0Tk1y0zbzw0T003zw1y07w1z07w0TU7w0Tk1y0zzzs0T000Tw1y07w1z07w0TU7w0Tk1y0zzzU0T000Dy1y07w1z07w0TU7w0Tk1y0zzy00T0007y1y07w1z07w0TU7w0Tk1y0zzs00T0U07y1y07w1z07w0TU7w0Tk1y0zzk00TzU03y1z07w1z07w0TU7w0Tk1y0zz000Tzk07y1z07w1z07w0TU7w0Tk1y0Tw080TTs07y1z07w1z07w0TU7w0Tk1y0Ts0Q0TTw0Dw1z0Tw1z07w0TU7w0Tk1y0Ts0y0TDy0zw1zVzw1z07w0TU7w0Tk1y0Dy1z0TDzzzs0zzzw1z07w0TU7w0Tk1y0DzzzUT7zzzs0zzzw1z07w0TU7w0Tk1y07zzzUT3zzzk0zzzw1z07w0TU7w0Tk1y03zzz0T1zzzU0Tzzw1z07w0TU7w0Tk1y01zzy0T0Tzy00Dzzw1z07w0TU7w0Tk1y00Tzs0T07zs007zzw1z07w0TU7w0Tk1y00DzU0T00y0000y601U0600M0600M01U000w00MU"

if (ok:=FindText(&X, &Y, 690-150000, 263-150000, 690+150000, 263+150000, 0, 0, SummerText))
{
  FindText().Click(X, Y, "L")
}


;==========



FindText(args*)
{
  static obj:=FindTextClass()
  return !args.Length ? obj : obj.FindText(args*)
}

Class FindTextClass
{  

Floor(i) => IsNumber(i) ? i+0 : 0

__New()
{
  this.bits:={ Scan0: 0, hBM: 0, oldzw: 0, oldzh: 0 }
  this.bind:={ id: 0, mode: 0, oldStyle: 0 }
  this.Lib:=Map()
  this.Cursor:=0
}

__Delete()
{
  if (this.bits.hBM)
    Try DllCall("DeleteObject", "Ptr",this.bits.hBM)
}

New()
{
  return FindTextClass()
}

FindText(&OutputX:="", &OutputY:=""
  , x1:=0, y1:=0, x2:=0, y2:=0, err1:=0, err0:=0, text:=""
  , ScreenShot:=1, FindAll:=1, JoinText:=0, offsetX:=20, offsetY:=10
  , dir:=0, zoomW:=1, zoomH:=1)
{
  if IsSet(OutputX) && (OutputX ~= "i)^\s*wait[10]?\s*$")
  {
    found:=!InStr(OutputX, "0"), time:=this.Floor(OutputY ?? 0)
    , timeout:=A_TickCount+Round(time*1000), OutputX:=""
    Loop
    {
      ok:=this.FindText(,, x1, y1, x2, y2, err1, err0, text, ScreenShot
        , FindAll, JoinText, offsetX, offsetY, dir, zoomW, zoomH)
      if (found && ok)
      {
        OutputX:=ok[1].x, OutputY:=ok[1].y
        return ok
      }
      if (!found && !ok)
        return 1
      if (time>=0 && A_TickCount>=timeout)
        Break
      Sleep 50
    }
    return 0
  }
  x1:=this.Floor(x1), y1:=this.Floor(y1), x2:=this.Floor(x2), y2:=this.Floor(y2)
  if (x1=0 && y1=0 && x2=0 && y2=0)
    n:=150000, x:=y:=-n, w:=h:=2*n
  else
    x:=Min(x1,x2), y:=Min(y1,y2), w:=Abs(x2-x1)+1, h:=Abs(y2-y1)+1
  bits:=this.GetBitsFromScreen(&x,&y,&w,&h,ScreenShot,&zx,&zy), x-=zx, y-=zy
  , this.ok:=0, info:=[]
  Loop Parse, text, "|"
    if IsObject(j:=this.PicInfo(A_LoopField))
      info.Push(j)
  if (w<1 || h<1 || !(num:=info.Length) || !bits.Scan0)
  {
    return 0
  }
  arr:=[], info2:=Map(), k:=0, s:=""
  , mode:=(IsObject(JoinText) ? 2 : JoinText ? 1 : 0)
  For i,j in info
  {
    k:=Max(k, (j[7]=5 && j[8]!=2 ? j[9] : j[2]*j[3]))
    if (mode)
      v:=(mode=1 ? i : j[10]) . "", s.="|" v
      , (v!="") && ((!info2.Has(v) && info2[v]:=[]), info2[v].Push(j))
  }
  sx:=x, sy:=y, sw:=w, sh:=h, (mode=1 && JoinText:=[s])
  , allpos_max:=(FindAll || JoinText ? 10000:1)
  , s1:=Buffer(k*4), s0:=Buffer(k*4)
  , ss:=Buffer(sw*(sh+3)), allpos:=Buffer(allpos_max*8)
  , ini:={ sx:sx, sy:sy, sw:sw, sh:sh, zx:zx, zy:zy
  , mode:mode, bits:bits, ss:ss.Ptr, s1:s1.Ptr, s0:s0.Ptr
  , allpos:allpos.Ptr, allpos_max:allpos_max
  , err1:err1, err0:err0, zoomW:zoomW, zoomH:zoomH }
  Loop 2
  {
    if (err1=0 && err0=0) && (num>1 || A_Index>1)
      ini.err1:=err1:=0.05, ini.err0:=err0:=0.05
    if (!JoinText)
    {
      For i,j in info
      Loop this.PicFind(ini, j, dir, sx, sy, sw, sh)
      {
        v:=NumGet(allpos,4*A_Index-4,"uint"), x:=(v&0xFFFF)+zx, y:=(v>>16)+zy
        , w:=Floor(j[2]*zoomW), h:=Floor(j[3]*zoomH)
        , arr.Push({1:x, 2:y, 3:w, 4:h, x:x+w//2, y:y+h//2, id:j[10]})
        if (!FindAll)
          Break 3
      }
    }
    else
    For k,v in JoinText
    {
      v:=StrSplit(Trim(RegExReplace(v, "\s*\|[|\s]*", "|"), "|")
      , (InStr(v,"|")?"|":""), " `t")
      , this.JoinText(arr, ini, info2, v, 1, offsetX, offsetY
      , FindAll, dir, 0, 0, 0, sx, sy, sw, sh)
      if (!FindAll && arr.Length)
        Break 2
    }
    if (err1!=0 || err0!=0 || arr.Length || info[1][4] || info[1][7]=5)
      Break
  }
  if (arr.Length)
  {
    OutputX:=arr[1].x, OutputY:=arr[1].y, this.ok:=arr
    return arr
  }
  return 0
}

; the join text object use [ "abc", "xyz", "a1|a2|a3" ]

JoinText(arr, ini, info2, text, index, offsetX, offsetY
  , FindAll, dir, minX, minY, maxY, sx, sy, sw, sh)
{
  if !(Len:=text.Length) || !info2.Has(key:=text[index])
    return 0
  zoomW:=ini.zoomW, zoomH:=ini.zoomH, mode:=ini.mode
  For i,j in info2[key]
  if (mode!=2 || key==j[10])
  Loop ok:=this.PicFind(ini, j, dir, sx, sy, (index=1 ? sw
  : Min(sx+offsetX+Floor(j[2]*zoomW),ini.sx+ini.sw)-sx), sh)
  {
    if (A_Index=1)
    {
      pos:=[], p:=ini.allpos-4
      Loop ok
        pos.Push(NumGet(p+=4,"uint"))
    }
    v:=pos[A_Index], x:=v&0xFFFF, y:=v>>16
    , w:=Floor(j[2]*zoomW), h:=Floor(j[3]*zoomH)
    , (index=1 && (minX:=x, minY:=y, maxY:=y+h))
    , minY1:=Min(y, minY), maxY1:=Max(y+h, maxY), sx1:=x+w
    if (index<Len)
    {
      sy1:=Max(minY1-offsetY, ini.sy)
      , sh1:=Min(maxY1+offsetY, ini.sy+ini.sh)-sy1
      if this.JoinText(arr, ini, info2, text, index+1, offsetX, offsetY
      , FindAll, 5, minX, minY1, maxY1, sx1, sy1, 0, sh1)
      && (index>1 || !FindAll)
        return 1
    }
    else
    {
      comment:=""
      For k,v in text
        comment.=(mode=2 ? v : info2[v][1][10])
      x:=minX+ini.zx, y:=minY1+ini.zy, w:=sx1-minX, h:=maxY1-minY1
      , arr.Push({1:x, 2:y, 3:w, 4:h, x:x+w//2, y:y+h//2, id:comment})
      if (index>1 || !FindAll)
        return 1
    }
  }
  return 0
}

PicFind(ini, j, dir, sx, sy, sw, sh)
{
  static MyFunc:=""
  if (!MyFunc)
  {
    x32:="VVdWU4HsmAAAAIuEJNQAAAADhCTMAAAAi5wk@AAAAIO8JKwAAAAFiUQkIIuEJPgA"
    . "AACNBJiJRCQ0D4RKBgAAi4Qk6AAAAIXAD45ADwAAiXwkEIu8JOQAAAAx7ccEJAAA"
    . "AADHRCQIAAAAAMdEJBQAAAAAx0QkDAAAAACNtgAAAACLhCTgAAAAi0wkDDH2MdsB"
    . "yIX@iUQkBH896ZAAAABmkA+vhCTMAAAAicGJ8Jn3@wHBi0QkBIA8GDF0TIuEJNwA"
    . "AACDwwEDtCQAAQAAiQyog8UBOd90VIsEJJn3vCToAAAAg7wkrAAAAAR1tQ+vhCTA"
    . "AAAAicGJ8Jn3@40MgYtEJASAPBgxdbSLRCQUi5Qk2AAAAIPDAQO0JAABAACJDIKD"
    . "wAE534lEJBR1rAF8JAyDRCQIAYu0JAQBAACLRCQIATQkOYQk6AAAAA+FMv@@@4tE"
    . "JBSLfCQQD6+EJOwAAACJbCQwwfgKiUQkKIuEJPAAAAAPr8XB+AqJRCRAg7wkrAAA"
    . "AAQPhCIGAACLhCTAAAAAi5wkxAAAAA+vhCTIAAAAjSyYi4QkzAAAAIucJMAAAAD3"
    . "2IO8JKwAAAABjQSDiUQkLA+ELwYAAIO8JKwAAAACD4Q4CAAAg7wkrAAAAAMPhLkL"
    . "AACLjCTQAAAAhckPjicBAACLhCTMAAAAi6wkzAAAAMdEJAwAAAAAx0QkEAAAAACJ"
    . "fCQYg+gBiUQkCI22AAAAAIt8JBCLtCTUAAAAMcCLXCQgAfsB94Xtif6J738X6bwA"
    . "AADGBAYEg8ABg8MBOccPhKQAAACDvCSsAAAAA3@khcAPtgsPhLoPAAAPtlP@iVQk"
    . "BDlEJAgPhMIPAAAPtlMBiRQki5Qk9AAAAIXSD4SfAQAAD7bpugYAAACD7QGD@QF2"
    . "G4N8JAQBD5TCgzwkAYnVD5TCCeoPttIB0oPKBIHh@QAAAL0BAAAAdByLTCQEiywk"
    . "hckPlEQkBIXtD5TBic0PtkwkBAnNCeqDwwGIFAaDwAE5xw+FXP@@@wF8JBCJ@YNE"
    . "JAwBi0QkDDmEJNAAAAAPjwz@@@+LfCQYg7wkrAAAAAN@FouEJPQAAACFwA+VwDwB"
    . "g5wkxAAAAP+LXCQUi3QkKDHAOfOLdCRAD07YiVwkFItcJDA58w9Pw4lEJDCLhCTM"
    . "AAAAK4QkAAEAAIlEJASLhCTQAAAAK4QkBAEAAIO8JLgAAAAJiUQkCA+ExgAAAIuE"
    . "JLgAAACD6AGD+AcPh7wCAACD+AOJRCQkD463AgAAi0QkBMdEJEQAAAAAx0QkDAAA"
    . "AACJBCSLRCQIiUQkHItcJEQ5HCTHRCRMAAAAAA+MCwEAAItcJEw5XCQcD4zCDQAA"
    . "i3QkRItcJCSLBCQp8PbDAg9Exot0JEyJwotEJBwp8PbDAQ9ExoP7A4nWD0@wD0@C"
    . "iXQkGIlEJBDp3gsAAI12AA+20YPqAYP6AhnSg+ICg8IEgeH9AAAAD5TBCcqIFAbp"
    . "8v3@@4tcJASLdCQIx0QkZAAAAADHRCRgAQAAAMdEJFQAAAAAx0QkWAAAAACJ2I1W"
    . "AYk0JMHoH4lcJBzHRCQMAAAAAAHY0fiJRCQQifDB6B8B8NH4iUQkGInYg8ABicEP"
    . "r8o50A9MwoPACIlMJHyJwQ+vyImMJIAAAACLXCR8OVwkZH0Zi5wkgAAAADlcJFjH"
    . "RCRcAAAAAA+M9QQAAIuMJLgAAACFyQ+FnQIAAIuUJPgAAACF0g+EjgIAAIuEJAQB"
    . "AAAPr4QkAAEAAIP4AQ+EdgIAAIN8JAwBD46lCgAAi0QkNIucJPgAAAAx7cdEJAQA"
    . "AAAAiSwkjXgEi0QkDIPoAYlEJBCLRCQEiwwkizeLRAMEhcmJRCQIich4NotP@DnO"
    . "D4N1BQAAifqNa@zrDY12AIPqBItK@DnOcxeJCotMhQSJTIMEg+gBg@j@deS4@@@@"
    . "@4tMJDSDwAGDBCQBg8cEg0QkBASJNIGLdCQIiTSDiwQkO0QkEHWNi4QkBAEAAIus"
    . "JAABAAAPr8APr+2JRCQEi7Qk+AAAAMdEJAgAAAAAMduLRCQIiwSGiUQkEA+3+MHo"
    . "EIXbiQQkdC0xyY22AAAAAIsUjg+3win4D6@AOeh9D8HqECsUJA+v0jtUJAR8EYPB"
    . "ATnZdduLRCQQiQSeg8MBg0QkCAGLRCQIOUQkDHWiidiBxJgAAABbXl9dwlwAx0Qk"
    . "JAAAAACLRCQIx0QkRAAAAADHRCQMAAAAAIkEJItEJASJRCQc6UT9@@8xwIO8JLAA"
    . "AAACD5TAiYQkhAAAAA+EUAQAADHAg7wksAAAAAGLrCS0AAAAD5TAhe2JRCR4D4SG"
    . "CwAAi7Qk2AAAAIuUJLQAAAAx7YucJOAAAACLjCTcAAAAiXwkCI0ElolEJASNdCYA"
    . "izuDxgSDw1iDwQSJ+MHoEA+vhCQEAQAAmfe8JOgAAAAPr4QkwAAAAIkEJA+3xw+v"
    . "hCQAAQAAmfe8JOQAAACLFCSNBIKJRvyLQ6yNREUAg8UWiUH8O3QkBHWmi4QktAAA"
    . "AIm8JLAAAACLfCQIiUQkFIuEJOwAAAAPr4QktAAAAMH4ColEJCiLhCTgAAAAx0Qk"
    . "QAAAAADHRCQwAAAAAIPACIlEJFDpSfr@@4tEJAyBxJgAAABbXl9dwlwAi4QksAAA"
    . "AMHoEA+vhCQEAQAAmfe8JOgAAAAPr4QkwAAAAInBD7eEJLAAAAAPr4QkAAEAAJn3"
    . "vCTkAAAAjQSBiYQksAAAAOnt+f@@i4Qk6AAAAIu0JNAAAAAPr4Qk5AAAANGkJLQA"
    . "AAADhCTgAAAAhfaJRCRQD47z+v@@i4QkzAAAAInqi2wkUMdEJCQAAAAAx0QkOAAA"
    . "AADB4AKJRCRIMcCLnCTMAAAAhdsPjisBAACLnCS8AAAAAdMDVCRIiVwkEItcJCAD"
    . "XCQ4iVQkPAOUJLwAAACJXCQYiVQkHI12AI28JwAAAACLdCQQMds5nCS0AAAAD7ZO"
    . "AolMJAQPtk4BD7Y2iUwkCIl0JAx2W412AI28JwAAAACLRJ0Ag8MCi3yd@InCD7bM"
    . "D7bAK0QkDMHqECtMJAgPttIrVCQEgf@@@@8AiQQkdyUPr9IPr8mNFFIPr8CNFIqN"
    . "BEI5x3NGMcA5nCS0AAAAd6+JwutBif7B7hCJ8A+28A+v0g+v9jnyd92J+A+21A+v"
    . "yQ+v0jnRd86LNCSJ+A+20A+v0onwD6@GOdB3uroBAAAAuAEAAACLXCQYg0QkEASL"
    . "TCQQiBODwwE7TCQciVwkGA+FGv@@@4u0JMwAAAABdCQ4i1QkPINEJCQBA1QkLItc"
    . "JCQ5nCTQAAAAD4Ws@v@@6U34@@+LRCQQhcB4G4tcJBw52H8Ti0QkGIXAeAuLHCQ5"
    . "2A+ONwYAAItsJFSF7Q+F4AUAAINsJBgBg0QkXAGDRCRYAYt0JGA5dCRcfLiLXCRU"
    . "idiD4AEBxonYg8ABiXQkYIPgA4lEJFTpvvr@@4uEJLAAAACLjCTQAAAAxwQkAAAA"
    . "AMdEJAQAAAAAg8ABweAHiYQksAAAAIuEJMwAAADB4AKFyYlEJAwPjsz4@@+J6Ius"
    . "JLAAAACJfCQQi5QkzAAAAIXSfmaLjCS8AAAAi1wkIIu8JLwAAAADXCQEAcEDRCQM"
    . "iUQkCAHHjXYAjbwnAAAAAA+2UQIPtkEBD7Yxa8BLa9ImAcKJ8MHgBCnwAdA5xQ+X"
    . "A4PBBIPDATn5ddWLnCTMAAAAAVwkBItEJAiDBCQBA0QkLIs8JDm8JNAAAAAPhXf@"
    . "@@+LfCQQ6Qb3@@+LBCTprvr@@4uEJOgAAACLvCTgAAAAD6+EJOQAAADRpCS0AAAA"
    . "jQSHiUQkUIuEJPAAAADB+AqDwAGJRCQki4Qk6AAAAIXAD45ECgAAi3wkJIuEJAQB"
    . "AACLdCRQx0QkMAAAAADHRCQUAAAAAA+vx4lEJECLhCTkAAAAD6@HweACiUQkSIuE"
    . "JOAAAACDwAKJRCQ4ifiNPL0AAAAAiXwkLInHD6+EJAABAACJfCQ8iUQkKIuEJOQA"
    . "AACFwA+OaQEAAItEJDjHRCQcAAAAAIlEJBCLRCQkiUQkGItEJBC7AgAAAA+2OIk8"
    . "JA+2eP8PtkD+iXwkBIlEJAg5nCS0AAAAD4bCAAAAiwSeg8MCi3ye@InCD7bMD7bA"
    . "K0QkCMHqECtMJAQPttIrFCSB@@@@@wCJRCQMd0YPr9IPr8mNFFIPr8CNFIqNBEI5"
    . "x3Kui3wkGItEJCSLTCQsAUwkEItMJCgBTCQcAfg5vCTkAAAAD465AAAAiUQkGOlf"
    . "@@@@if3B7RCJ6A+26A+v0g+v7TnqD4dm@@@@ifgPttQPr8kPr9I50Q+HU@@@@4tM"
    . "JAyJ+A+2+A+v@4nID6@BOfh2kDmcJLQAAAAPhz7@@@+LRCQwi3wkFJmNHL0AAAAA"
    . "97wk6AAAAA+vhCTAAAAAicGLRCQcmfe8JOQAAACLFCTB4hCNBIGLjCTYAAAAiQS5"
    . "i0QkBIPHAYl8JBSLvCTcAAAAweAICdALRCQIiQQf6SD@@@+LfCQ8i0QkJItMJEAB"
    . "TCQwi0wkSAFMJDgB+Dm8JOgAAAB+CYlEJDzpXP7@@4tEJBQPr4Qk7AAAAMH4ColE"
    . "JCiLRCRQx0QkQAAAAADHRCQwAAAAAIt4BIn4ifvB6BAPtteJ+w+2wA+2y4nDD6@Y"
    . "idAPr8KJXCRwiUQkdInID6@BiUQkbOlH9P@@i4Qk0AAAAIXAD45u9f@@i5wkzAAA"
    . "AItEJCDHBCQAAAAAx0QkBAAAAACJfCQMjQRYiUQkGInYweACiUQkCIu0JMwAAACF"
    . "9n5Xi4wkvAAAAItcJBiLvCS8AAAAA1wkBAHpA2wkCAHvD7ZRAoPBBIPDAWvyJg+2"
    . "Uf1rwkuNFAYPtnH8ifDB4AQp8AHQwfgHiEP@Ofl10ou8JMwAAAABfCQEgwQkAQNs"
    . "JCyLBCQ5hCTQAAAAdYqLhCTMAAAAi3wkDDHti5QktAAAADH2g+gBiXwkJIlEJAyL"
    . "hCTQAAAAg+gBiUQkEIucJMwAAACF2w+O4gAAAIu8JMwAAACLRCQYAfeNDDCJ+4l8"
    . "JByJxwHfifMrnCTMAAAAiXwkBIt8JCABwwH3McCJfCQIiRwkhcAPhGQDAAA5RCQM"
    . "D4RaAwAAhe0PhFIDAAA5bCQQD4RIAwAAD7YRD7Z5@74BAAAAA5QksAAAADn6ckYP"
    . "tnkBOfpyPos8JA+2Pzn6cjSLXCQED7Y7OfpyKYs8JA+2f@85+nIeizwkD7Z@ATn6"
    . "chMPtnv@OfpyCw+2cwE58g+Sw4nei3wkCInziBwHg8ABg8EBg0QkBAGDBCQBOYQk"
    . "zAAAAA+FWv@@@4t0JByDxQE5rCTQAAAAD4X@@v@@i3wkJImUJLQAAADpY@L@@8dE"
    . "JEAAAAAAx0QkKAAAAADHRCQwAAAAAMdEJBQAAAAA6cfx@@+DfCRUAQ+E6gEAAIN8"
    . "JFQCD4SVAgAAg2wkEAHpBfr@@4uEJAQBAACLrCQAAQAAD6@AD6@tiUQkBItEJAyF"
    . "wA+P6PX@@zHA6VL2@@+DRCRkAcdEJCQJAAAAi0QkGIucJNQAAAAPr4QkzAAAAANE"
    . "JBCAPAMDD4ZnAQAAi3QkFItcJDA53g9N3oO8JKwAAAADiVwkIA+OdQEAAItEJBgD"
    . "hCTIAAAAD6+EJMAAAACLVCQQA5QkxAAAAIO8JKwAAAAFD4RsAgAAjTSQi4QksAAA"
    . "AIucJLwAAAAB8A+2XAMCiVwkOIucJLwAAAAPtlwDAYlcJDyLnCS8AAAAD7YEA4lE"
    . "JEiLRCQghcAPhKoBAACLRCRAiXwkLDHbi2wkKIu8JLwAAACJRCRo62KNtCYAAAAA"
    . "OVwkMH5Ii4Qk3AAAAIsUmAHyD7ZEFwIPtkwXAStEJDgrTCQ8D7YUFytUJEgPr8AP"
    . "r8mNBEAPr9KNBIiNBFA5hCS0AAAAcgeDbCRoAXhhg8MBOVwkIA+EogEAADlcJBR+"
    . "n4uEJNgAAACLFJgB8g+2RBcCD7ZMFwErRCQ4K0wkPA+2FBcrVCRID6@AD6@JjQRA"
    . "D6@SjQSIjQRQOYQktAAAAA+DWv@@@4PtAQ+JUf@@@4t8JCyDfCQkCQ+EKfj@@4NE"
    . "JEwB6Try@@+DRCQQAekm+P@@g0QkRAHpEfL@@410JgCF2w+EoAAAAAOEJNQAAACL"
    . "XCRAMdKLbCQoicHrJTlUJDB+Fou0JNwAAACLBJYByPYAAXUFg+sBeJqDwgE5VCQg"
    . "dGo5VCQUftWLtCTYAAAAiwSWAcj2AAJ1xIPtAXm@6XD@@@@HRCQEAwAAAOlB8P@@"
    . "i3wkCMYEBwLpEf3@@8cEJAMAAADpOfD@@8dEJCgAAAAAx0QkFAAAAADpGPX@@4NE"
    . "JBgB6XD3@@+LbCQoi4Qk+AAAAINEJAwBhcAPhMoDAACLVCQYA5QkyAAAAItcJAyL"
    . "RCQQA4QkxAAAAIu0JPgAAADB4hCNi@@@@z8J0IkEjou0JLgAAACF9g+F0gIAAItE"
    . "JCiLdCQ0Keg5nCT8AAAAiQSOD44z8v@@6bb+@@+LfCQs64mLtCSEAAAAjQSQiUQk"
    . "PIX2D4WuAQAAi1wkIItEJFAx9otsJCiF24lEJGgPhFn@@@+LhCTYAAAAi1wkaItU"
    . "JDwDFLCJXCRIa8YWgTv@@@8AiUQkOA+XwA+2wIlEJCyLhCTcAAAAiwSwiYQktAAA"
    . "AIuEJLwAAAAPtkQQAomEJIwAAADB4BCJwYuEJLwAAAAPtkQQAYmEJJAAAADB4AgJ"
    . "yIuMJLwAAAAPtgwRCciJjCSUAAAAiYQkiAAAAOsfD6@SD6@JjRRSD6@AjRSKjQRC"
    . "OccPg70AAACDRCRICItEJDg7hCS0AAAAD4PPAAAAi1QkeIt8JEiDRCQ4AoXSiweL"
    . "fwR0JoX2i5wkiAAAAA9FnCSwAAAAhcAPlMAPtsCJRCQsiZwksAAAAInYicIPtswP"
    . "tsDB6hArjCSQAAAAK4QklAAAAA+20iuUJIwAAACB@@@@@wAPhmX@@@+J+8HrEA+2"
    . "2w+v0g+v2znaD4dp@@@@ifsPttcPr8kPr9I50Q+HVv@@@4n7D7bTD6@AD6@SOdAP"
    . "h0P@@@+LRCQshcB0CYPtAQ+IDf3@@4PGAYNEJGhYOXQkIA+Fe@7@@+nP@f@@i0Qk"
    . "LIXAdeHr1otMJCCLbCQohckPhLX9@@8x9usuOUQkcHwSD6@JOUwkdHwJD6@SOVQk"
    . "bH0Jg+0BD4i3@P@@g8YBOXQkIA+Eg@3@@4uEJNgAAACLVCQ8i5wkvAAAAAMUsIuE"
    . "JNwAAACLBLCJhCSwAAAAi4QkvAAAAIuMJLAAAAAPtkQQAsHpEA+2ySnID7ZMEwGL"
    . "nCSwAAAAD6@AD7bfKdmLnCS8AAAAD7YUEw+2nCSwAAAAKdqB@@@@@wAPh1z@@@8P"
    . "r8mNBEAPr9KNBIiNBFA5xw+CXf@@@+lh@@@@x0QkKAAAAADHRCQUAAAAAOnC9@@@"
    . "i1wkDDmcJPwAAACJ2A+OrfD@@4tcJBgxyYnOidgrhCQEAQAAg8ABD0jBicKJ2Iuc"
    . "JAQBAACNRBj@i1wkCDnDD07Di1wkEInFidgrhCQAAQAAg8ABD0nwidiLnCQAAQAA"
    . "jUQY@4tcJAQ5ww9OwznVicMPjIz7@@+LhCTMAAAAg8UBD6@CA4Qk1AAAAInBjUMB"
    . "iUQkIDnefw+J8IAkAQODwAE7RCQgdfODwgEDjCTMAAAAOep13+lJ+@@@i6wkuAAA"
    . "AIXtD4VK@@@@6TX7@@+QkA=="
    x64:="QVdBVkFVQVRVV1ZTSIHsyAAAAEhjhCRQAQAASIu8JKgBAACJjCQQAQAAiVQkMESJ"
    . "jCQoAQAAi7QkgAEAAIusJIgBAABJicRIiUQkWEgDhCRgAQAAg@kFSIlEJChIY4Qk"
    . "sAEAAEiNBIdIiUQkYA+E3AUAAIXtD44BDAAARTH2iVwkEIu8JLgBAABEiXQkCIuc"
    . "JBABAABFMe1Mi7QkcAEAAEUx20Ux@0SJbCQYRImEJCABAABMY1QkCEUxyUUxwEwD"
    . "lCR4AQAAhfZ@Mut3Dx9AAEEPr8SJwUSJyJn3@gHBQ4A8AjF0PEmDwAFJY8dBAflB"
    . "g8cBRDnGQYkMhn5DRInYmff9g@sEdckPr4QkOAEAAInBRInImff+Q4A8AjGNDIF1"
    . "xEiLlCRoAQAASYPAAUljxUEB+UGDxQFEOcaJDIJ@vQF0JAiDRCQYAUQDnCTAAQAA"
    . "i0QkGDnFD4VX@@@@RInoi1wkEESLhCQgAQAAD6+EJJABAABEiWwkGMH4ColEJByL"
    . "hCSYAQAAQQ+vx8H4ColEJECDvCQQAQAABA+EtwUAAIuEJDgBAACLvCRAAQAAD6+E"
    . "JEgBAACNBLiLvCQ4AQAAiUQkCESJ4PfYg7wkEAEAAAGNBIeJRCQgD4SxBQAAg7wk"
    . "EAEAAAIPhIQHAACDvCQQAQAAAw+EowoAAIuEJFgBAACFwA+OHwEAAESJfCQQRIuc"
    . "JBABAABBjWwk@0yLfCQoi7wkoAEAAEUx9kUx7YlcJAhEiYQkIAEAAA8fhAAAAAAA"
    . "RYXkD467AAAASWPFMclJicFNjUQHAUwDjCRgAQAA6xhBxgEEg8EBSYPBAUmDwAFB"
    . "OcwPhIkAAABBg@sDf+KFyUEPtlD@D4S1DgAAQQ+2WP45zQ+Euw4AAEUPthCF@w+E"
    . "fAEAAA+28rgGAAAAg+4Bg@4BdhiD+wFAD5TGQYP6AQ+UwAnwD7bAAcCDyASB4v0A"
    . "AAC+AQAAAHQOhdtAD5TGRYXSD5TCCdYJ8IPBAUmDwQFBiEH@SYPAAUE5zA+Fd@@@"
    . "@0UB5UGDxgFEObQkWAEAAA+PKv@@@4tcJAhEi3wkEESLhCQgAQAAg7wkEAEAAAN@"
    . "FouEJKABAACFwA+VwDwBg5wkQAEAAP+LfCQYi3QkHDHARInlRIucJFgBAAA59w9O"
    . "+EQ7fCRAiXwkGEQPTvgrrCS4AQAARCucJMABAACDvCQoAQAACQ+EuQAAAIuEJCgB"
    . "AACD6AGD+AcPh5ACAACD+AOJRCRID46LAgAAiWwkCESJXCQQRTH2x0QkTAAAAACL"
    . "fCRMOXwkCMdEJGgAAAAAD4wNAQAAi3wkaDl8JBAPjNIMAACLfCRIi3QkTItEJAgp"
    . "8ED2xwIPRMaLdCRoicKLRCQQKfBA9scBD0TGg@8DidcPT@gPT8JBicXptgoAAGaQ"
    . "D7bCg+gBg@gCGcCD4AKDwASB4v0AAAAPlMIJ0EGIAekg@v@@iehBjVMBRIlcJAjB"
    . "6B+JbCQQx4QkiAAAAAAAAAAB6MeEJIQAAAABAAAAx0QkbAAAAADR+MdEJHwAAAAA"
    . "QYnFRInYwegfRAHY0fiJx41FAYnGD6@yOdAPTMJFMfaDwAiJtCSkAAAAicYPr@CJ"
    . "tCSoAAAAi7QkpAAAADm0JIgAAAB9HIu0JKgAAAA5dCR8x4QkgAAAAAAAAAAPjEYE"
    . "AACLhCQoAQAAhcAPhV0CAABIg7wkqAEAAAAPhE4CAACLhCTAAQAAD6+EJLgBAACD"
    . "+AEPhDYCAABBg@4BD45dCQAAQY1G@kyLRCRgTIucJKgBAABFMclFMdJIjRyFBAAA"
    . "AEOLdAgEQ4sUCESJ0UOLfAsETInQOdZyE+kJBAAAZpBIg+gBQYsUgDnWcx1BiVSA"
    . "BEGLFIOD6QGD+f9BiVSDBHXeSMfA@@@@@0mDwQRIg8ABSYPCAUk52UGJNIBBiTyD"
    . "dZ9Ei5QkuAEAAIucJMABAABFD6@SD6@bTIuMJKgBAAAx9jHAQYsssYnvRA+33cHv"
    . "EIXAdDJFMcAPH4QAAAAAAEOLDIEPt9FEKdoPr9JEOdJ9DMHpECn5D6@JOdl8E0mD"
    . "wAFEOcB@2Uhj0IPAAUGJLJFIg8YBQTn2f6pIgcTIAAAAW15fXUFcQV1BXkFfw8dE"
    . "JEgAAAAARIlcJAiJbCQQRTH2x0QkTAAAAADpcP3@@4tEJDAx@4P4AkAPlMeJvCSs"
    . "AAAAD4SpAwAAMcCDfCQwAQ+UwEWFwImEJKAAAAAPhNsKAABEiaQkUAEAAEyLlCR4"
    . "AQAARTHJi7wkOAEAAEyLpCRoAQAARTHbTIusJHABAABEi7QkuAEAAESLvCTAAQAA"
    . "iVwkGEGLGkmDwliJ2MHoEEEPr8eZ9@0Pr8eJwQ+3w0EPr8aZ9@6NBIFDiQSMQYtC"
    . "rEGNBENBg8MWQ4lEjQBJg8EBRTnId72LhCSQAQAARIukJFABAACJXCQwi1wkGESJ"
    . "RCQYQQ+vwMH4ColEJBxIi4QkeAEAAMdEJEAAAAAARTH@SIPACEiJBCTpq@r@@0SJ"
    . "8OnE@v@@i3wkMIn4wegQD6+EJMABAACZ9@0Pr4QkOAEAAInBD7fHD6+EJLgBAACZ"
    . "9@6NBIGJRCQw6Wv6@@+J6ESLjCRYAQAARQHAD6@GSJhIA4QkeAEAAEWFyUiJBCQP"
    . "jnL7@@9CjTylAAAAAMdEJBAAAAAAMcDHRCRIAAAAAESJfCR4iXwkUEWF5A+O6QAA"
    . "AEhjVCQISIu8JDABAABFMe1MY3QkSEwDdCQoSI1sFwJMiwwkRTHSD7Z9AA+2df9E"
    . "D7Zd@usmZi4PH4QAAAAAAA+vyQ+v0o0MSQ+vwI0UkY0EQjnDc2hJg8EIMcBFOcIP"
    . "gxsBAABBiwFBi1kEQYPCAonBD7bUD7bAwekQKfJEKdgPtskp+YH7@@@@AHazQYnf"
    . "QcHvEEUPtv8Pr8lFD6@@RDn5d7IPts8Pr9IPr8k5ynelD7bTD6@AD6@SOdB3mLoB"
    . "AAAAuAEAAABDiBQuSYPFAUiDxQRFOewPj0P@@@+LdCRQRAFkJEgBdCQIg0QkEAGL"
    . "VCQgi3wkEAFUJAg5vCRYAQAAD4Xw@v@@RIt8JHjpFvn@@0WF7XgVRDtsJBB@DoX@"
    . "eAo7fCQID464BQAAi0QkbIXAD4WNBQAAg+8Bg4QkgAAAAAGDRCR8AYuUJIQAAAA5"
    . "lCSAAAAAfLqLdCRsifCD4AEBwonwg8ABiZQkhAAAAIPgA4lEJGzpW@v@@w8fRAAA"
    . "icLpQf@@@0yJ0Oka@P@@i0QkMIuMJFgBAAAx9jH@Qo0spQAAAACDwAHB4AeFyYlE"
    . "JDAPjo@5@@9Ei3QkCESLbCQwRYXkflVIi5QkMAEAAExj30wDXCQoSWPGRTHJSI1M"
    . "AgIPthEPtkH@RA+2Uf5rwEtr0iYBwkSJ0MHgBEQp0AHQQTnFQw+XBAtJg8EBSIPB"
    . "BEU5zH@MQQHuRAHng8YBRAN0JCA5tCRYAQAAdZXp9vf@@4noRQHAD6@GweACSJhI"
    . "A4QkeAEAAEiJBCSLhCSYAQAAwfgKg8ABhe2JRCQID46VCgAAi3wkCIuEJMABAADH"
    . "RCRIAAAAAMdEJBgAAAAARImkJFABAACJrCSIAQAAD6@HiXwkUIlEJHiJ+A+vxsHg"
    . "AkiYSIlEJHBIi4QkeAEAAEiJRCRAifjB4AJImEiJRCQQi4QkuAEAAA+vx4lEJBxI"
    . "iwQkSIPACEiJRCQghfYPjiYBAABIi3wkQESLZCQIMe0Ptl8CTItMJCBBvgIAAABE"
    . "D7ZXAUQPth9Bid3rHQ8fAA+v2w+v0o0cWw+vwI0Uk40EQjnBc2pJg8EIRTnwD4Z9"
    . "AAAAQYsBQYtJBEGDxgKJww+21A+2wMHrEEQp0kQp2A+220Qp64H5@@@@AHazQYnP"
    . "QcHvEEUPtv8Pr9tFD6@@RDn7d7IPtt0Pr9IPr9s52nelD7bJD6@AD6@JOch3mGaQ"
    . "i0QkCEgDfCQQA2wkHEQB4EQ55n5lQYnE6UP@@@8PHwCLRCRIRIt0JBhEievB4xBB"
    . "weIIQQnamU1jzkUJ2ve8JIgBAAAPr4QkOAEAAInBieiZ9@5Ii5QkaAEAAI0EgUKJ"
    . "BIpEifCDwAGJRCQYSIuEJHABAABGiRSI64aLfCRQi0QkCItUJHgBVCRISItUJHBI"
    . "AVQkQAH4ObwkiAEAAH4JiUQkUOmk@v@@i0QkGESLpCRQAQAAD6+EJJABAADB+AqJ"
    . "RCQcSIsEJMdEJEAAAAAARTH@i1gEidgPts8PttPB6BAPtsCJxw+v+InID6@Bibwk"
    . "mAAAAImEJJwAAACJ0A+vwomEJJQAAADpffX@@8dEJEAAAAAAx0QkHAAAAABFMf@H"
    . "RCQYAAAAAOn19P@@i5QkWAEAAIXSD4589v@@Q40EZESLdCQIQo0spQAAAAAx9jH@"
    . "SJhIA4QkYAEAAEmJxUWF5H5aSIuUJDABAABJY8ZMY99FMclNAetIjUwCAg8fRAAA"
    . "D7YRSIPBBERr0iYPtlH7a8JLQY0UAkQPtlH6RInQweAERCnQAdDB+AdDiAQLSYPB"
    . "AUU5zH@KQQHuRAHng8YBRAN0JCA5tCRYAQAAdZBIi3wkWDHSQY1sJP9EiXwkSEUx"
    . "0olcJCBBiddIifhIg8ABSIlEJAi4AQAAAEiJxouEJFgBAABIKf6LfCQwSIl0JBBE"
    . "jXD@RYXkD47TAAAASItEJAhNY99Ii3QkKEuNVB0BTo0MGEiLRCQQTAHeTQHpSo0M"
    . "GDHATAHpZi4PH4QAAAAAAEiFwA+EgQMAADnFD4R5AwAARYXSD4RwAwAARTnWD4Rn"
    . "AwAARA+2Qv9ED7Za@rsBAAAAQQH4RTnYckZED7YaRTnYcj1ED7ZZ@0U52HIzRQ+2"
    . "Wf9FOdhyKUQPtln+RTnYch9ED7YZRTnYchZFD7ZZ@kU52HIMRQ+2GUU52A+Sw2aQ"
    . "iBwGSIPAAUiDwgFJg8EBSIPBAUE5xA+PZP@@@0UB50GDwgFEOZQkWAEAAA+FEv@@"
    . "@4tcJCBEi3wkSOmJ8@@@RIuUJLgBAACLnCTAAQAAMcBFD6@SD6@bRYX2D4569@@@"
    . "6RP3@@+DfCRsAQ+E@AEAAIN8JGwCD4S4AgAAQYPtAelX+v@@g4QkiAAAAAHHRCRI"
    . "CQAAAIn4SIu0JGABAABBD6@ERo0MKEljwYA8BgMPhqQBAACLRCQYRDn4QQ9Mx4O8"
    . "JBABAAADiUQkIA+OsAEAAIuEJEgBAACLlCRAAQAAAfhEAeoPr4QkOAEAAIO8JBAB"
    . "AAAFD4TAAgAARI0MkItEJDBIi7QkMAEAAESLVCQgRAHIjVACRYXSSGPSD7Y0Fo1Q"
    . "AUiYSGPSiXQkUEiLtCQwAQAAD7Y0Fol0JHhIi7QkMAEAAA+2BAaJRCRwD4TrAQAA"
    . "i0QkQESJXCQoRTHSi3QkHEyLnCQwAQAAiYQkjAAAAOtyRDu8JJAAAAB+WUiLhCRw"
    . "AQAAQosUkEQByo1CAo1KAUhj0kEPthQTSJhIY8krVCRwQQ+2BANBD7YMCytEJFAr"
    . "TCR4D6@SD6@AD6@JjQRAjQSIjQRQQTnAcgqDrCSMAAAAAXh+SYPCAUQ5VCQgD47P"
    . "AQAARDlUJBhEiZQkkAAAAA+Oe@@@@0iLhCRoAQAAQosUkEQByo1CAo1KAUhj0kEP"
    . "thQTSJhIY8krVCRwQQ+2BANBD7YMCytEJFArTCR4D6@SD6@AD6@JjQRAjQSIjQRQ"
    . "QTnAD4Mo@@@@g+4BD4kf@@@@RItcJCiDfCRICQ+Eavj@@4NEJGgB6Snz@@9Bg8UB"
    . "6Wb4@@+DRCRMAekA8@@@kIXAD4SzAAAARItUJECLdCQcMcnrM0Q7fCQofiJIi5Qk"
    . "cAEAAESJyAMEikiLlCRgAQAA9gQCAXUGQYPqAXiZSIPBATlMJCB+dzlMJBiJTCQo"
    . "fsNIi4QkaAEAAESJygMUiEiLhCRgAQAA9gQQAnWng+4BeaLpX@@@@w8fhAAAAAAA"
    . "uwMAAADpRvH@@8YEBgLp8Pz@@0G6AwAAAOk+8f@@x0QkHAAAAADHRCQYAAAAAOm7"
    . "9f@@g8cB6aD3@@+LdCQcQYPGAUiDvCSoAQAAAA+EHQQAAEljxouUJEgBAABIjQyF"
    . "AAAAAIuEJEABAAAB+sHiEEQB6AnQSIuUJKgBAACJRAr8i5QkKAEAAIXSD4UeAwAA"
    . "i0QkHCnwRDm0JLABAABIi3QkYIlEDvwPjhPz@@@ppf7@@0SLXCQo64aNBJCJRCQo"
    . "i4QkrAAAAIXAD4XjAQAAi0QkIIXAD4Rg@@@@SIsEJIt0JBxFMcnHRCR4AAAAAESJ"
    . "dCRwRIm8JIwAAABEiZwkkAAAAEiJRCRQSIuEJGgBAACLTCQoTIu8JDABAABMi1Qk"
    . "UEyLhCRwAQAARItcJHhCAwyIQYE6@@@@AEeLBIiNUQKNQQFIY8lBD5fGSGPSSJhF"
    . "D7b2QQ+2FBdBD7YEB4mUJLQAAACJhCS4AAAAweIQweAICdBBD7YUDwnQiZQkvAAA"
    . "AImEJLAAAADrHg+v0g+vyY0UUg+vwI0Uio0EQjnDD4OvAAAASYPCCEU5ww+D4AAA"
    . "AESLvCSgAAAAQYPDAkGLAkGLWgRFhf90Hk2FyYtUJDAPRJQksAAAAEUx9oXAQQ+U"
    . "xolUJDCJ0InCD7bMD7bAweoQK4wkuAAAACuEJLwAAAAPttIrlCS0AAAAgfv@@@8A"
    . "D4Z0@@@@QYnfQcHvEEUPtv8Pr9JFD6@@RDn6D4dz@@@@D7bXD6@JD6@SOdEPh2L@"
    . "@@8PttMPr8APr9I50A+HUf@@@0WF9nQFg+4BeDtJg8EBSINEJFBYg0QkeBZEOUwk"
    . "IA+Pkf7@@0SLdCRwRIu8JIwAAABEi5wkkAAAAOmu@f@@RYX2dcfrwESLdCRwRIu8"
    . "JIwAAABEi5wkkAAAAOml@P@@i0QkIIt0JByFwA+Eff3@@0Ux0us5OYQkmAAAAHwY"
    . "D6@JOYwknAAAAHwMD6@SOZQklAAAAH0Jg+4BD4hm@P@@SYPCAUQ5VCQgD44@@f@@"
    . "SIuEJGgBAACLVCQoTIuMJDABAABCAxSQSIuEJHABAABCiwSQicGNQgKJTCQwwekQ"
    . "SJgPtslBD7YEASnIjUoBSGPSD6@ASGPJRQ+2DAlIi0wkMA+2zUEpyUSJyUyLjCQw"
    . "AQAAQQ+2FBFED7ZMJDBEKcqB+@@@@wAPh0r@@@8Pr8mNBEAPr9KNBIiNBFA5ww+C"
    . "VP@@@+lY@@@@x0QkHAAAAADHRCQYAAAAAOlF9@@@RDm0JLABAABEifAPjhvx@@+J"
    . "+CuEJMABAABFMdKDwAFBD0jCicGLhCTAAQAAjUQH@0E5w0EPTsOJxkSJ6CuEJLgB"
    . "AACDwAFED0nQi4QkuAEAAEGNRAX@OcUPTsU5zolEJCAPjEH7@@9EieJJY8IPr9FI"
    . "Y9JIAdBIA4QkYAEAAEmJwY1GAYlEJCiLRCQgRCnQSI1wAUQ7VCQgfxNKjRQOTInI"
    . "gCADSIPAAUg50HX0g8EBTANMJFg7TCQoddjp6Pr@@4uMJCgBAACFyQ+FQf@@@+nU"
    . "+v@@kJCQkJCQkJCQkJCQkA=="
    MyFunc:=this.MCode(StrReplace((A_PtrSize=8?x64:x32),"@","/"))
  }
  text:=j[1], w:=j[2], h:=j[3]
  , err1:=this.Floor(j[4] ? j[5] : ini.err1)
  , err0:=this.Floor(j[4] ? j[6] : ini.err0)
  , mode:=j[7], color:=j[8], n:=j[9]
  ok:=(!ini.bits.Scan0 || mode<1 || mode>5) ? 0
    : DllCall(MyFunc.Ptr, "int",mode, "uint",color, "uint",n, "int",dir
    , "Ptr",ini.bits.Scan0, "int",ini.bits.Stride
    , "int",sx, "int",sy, "int",sw, "int",sh
    , "Ptr",ini.ss, "Ptr",ini.s1, "Ptr",ini.s0
    , "Ptr",text, "int",w, "int",h
    , "int",Floor(Abs(err1)*1024), "int",Floor(Abs(err0)*1024)
    , "int",(err1<0||err0<0), "Ptr",ini.allpos, "int",ini.allpos_max
    , "int",Floor(w*ini.zoomW), "int",Floor(h*ini.zoomH))
  return ok
}


PicInfo(text)
{
  if !InStr(text, "$")
    return
  static info:=Map(), bmp:=[]
  key:=(r:=StrLen(v:=Trim(text,"|")))<10000 ? v
    : DllCall("ntdll\RtlComputeCrc32", "uint",0
    , "Ptr",StrPtr(v), "uint",r*2, "uint")
  if info.Has(key)
    return info[key]
  comment:="", seterr:=err1:=err0:=0
  ; You Can Add Comment Text within The <>
  if RegExMatch(v, "<([^>\n]*)>", &r)
    v:=StrReplace(v,r[0]), comment:=Trim(r[1])
  ; You can Add two fault-tolerant in the [], separated by commas
  if RegExMatch(v, "\[([^\]\n]*)]", &r)
  {
    v:=StrReplace(v,r[0]), r:=StrSplit(r[1] ",", ",")
    , seterr:=1, err1:=r[1], err0:=r[2]
  }
  color:=SubStr(v,1,InStr(v,"$")-1), v:=Trim(SubStr(v,InStr(v,"$")+1))
  mode:=InStr(color,"##") ? 5 : InStr(color,"#") ? 4
    : InStr(color,"**") ? 3 : InStr(color,"*") ? 2 : 1
  color:=RegExReplace(StrReplace(color,"@","-"), "[*#\s]")
  (mode=1 || mode=5) && color:=StrReplace(color,"0x")
  if (mode=5)
  {
    if !(v~="^[\s\-\w.]+/[\s\-\w.]+/[\s\-\w./,]+$")  ; <FindPic>
    {
      if !(hBM:=LoadPicture(v))
      {
        MsgBox "Can't Load Picture ! " v, "Tip", 4096
        return
      }
      this.GetBitmapWH(hBM, &w, &h)
      if (w<1 || h<1)
        return
      hBM2:=this.CreateDIBSection(w, h, 32, &Scan0)
      this.CopyHBM(hBM2, 0, 0, hBM, 0, 0, w, h)
      DllCall("DeleteObject", "Ptr",hBM)
      if (!Scan0)
        return
      arr:=StrSplit(color "/", "/"), arr.Pop(), n:=arr.Length
      bmp.Push(buf:=Buffer(w*h*4 + n*2*4)), v:=buf.Ptr, p:=v+w*h*4-4
      DllCall("RtlMoveMemory", "Ptr",v, "Ptr",Scan0, "Ptr",w*h*4)
      DllCall("DeleteObject", "Ptr",hBM2), color:=Trim(arr[1],"-")
      For k1,v1 in arr
        c:=StrSplit(Trim(v1,"-") "-" color, "-")
        , x:=this.Floor(c[2]), x:=(x<=0||x>1?0:Floor(9*255*255*(1-x)*(1-x)))
        , NumPut("uint", this.ToRGB(c[1]), p+=4)
        , NumPut("uint", (InStr(c[2],".")?x:this.Floor("0x" c[2])|0x1000000), p+=4)
      color:=2
    }
    else  ; <FindMultiColor> or <FindColor> or <FindShape>
    {
      color:=Trim(StrSplit(color "/", "/")[1], "-")
      arr:=StrSplit(Trim(RegExReplace(v, "i)\s|0x"), ","), ",")
      if !(n:=arr.Length)
        return
      bmp.Push(buf:=Buffer(n*22*4)), v:=buf.Ptr
      shape:=(n>1 && StrLen(StrSplit(arr[1] "//","/")[3])=1 ? 1:0)
      For k1,v1 in arr
      {
        r:=StrSplit(v1 "/","/"), x:=this.Floor(r[1]), y:=this.Floor(r[2])
        , (A_Index=1) ? (x1:=x2:=x, y1:=y2:=y)
        : (x1:=Min(x1,x), x2:=Max(x2,x), y1:=Min(y1,y), y2:=Max(y2,y))
      }
      For k1,v1 in arr
      {
        r:=StrSplit(v1 "/","/"), x:=this.Floor(r[1])-x1, y:=this.Floor(r[2])-y1
        , NumPut("uint", y<<16|x, p:=v+(A_Index-1)*22*4)
        , NumPut("uint", n1:=Min(Max(r.Length-3,0),(shape?1:10)), p+=4)
        Loop n1
          c:=StrSplit(Trim(v1:=r[2+A_Index],"-") "-" color, "-")
          , x:=this.Floor(c[2]), x:=(x<=0||x>1?0:Floor(9*255*255*(1-x)*(1-x)))
          , NumPut("uint", this.ToRGB(c[1])&0xFFFFFF|(!shape&&InStr(v1,"-")=1?0x1000000:0), p+=4)
          , NumPut("uint", (InStr(c[2],".")?x:this.Floor("0x" c[2])|0x1000000), p+=4)
      }
      color:=shape, w:=x2-x1+1, h:=y2-y1+1
    }
  }
  else
  {
    r:=StrSplit(v ".", "."), w:=this.Floor(r[1])
    , v:=this.base64tobit(r[2]), h:=StrLen(v)//w
    if (w<1 || h<1 || StrLen(v)!=w*h)
      return
    arr:=StrSplit(color "/", "/"), arr.Pop(), n:=arr.Length
    , bmp.Push(buf:=Buffer(StrPut(v, "CP0") + n*2*4))
    , StrPut(v, buf.Ptr, "CP0"), v:=buf.Ptr, p:=v+w*h-4
    , color:=this.Floor(color)
    if (mode=1)
    {
      For k1,v1 in arr
        c:=StrSplit(Trim(v1,"-") "-", "-")
        , x:=this.Floor(c[2]), x:=(x<=0||x>1?0:Floor(9*255*255*(1-x)*(1-x)))
        , NumPut("uint", this.ToRGB(c[1]), p+=4)
        , NumPut("uint", (InStr(c[2],".")?x:this.Floor("0x" c[2])|0x1000000), p+=4)
    }
    else if (mode=4)
    {
      r:=StrSplit(Trim(arr[1],"-") "-", "-")
      , n:=this.Floor(r[2]), n:=(n<=0||n>1?0:Floor(9*255*255*(1-n)*(1-n)))
      , c:=this.Floor(r[1]), color:=(c<1||c>w*h?0:((c-1)//w)<<16|Mod(c-1,w))
    }
  }
  return info[key]:=[v, w, h, seterr, err1, err0, mode, color, n, comment]
}

ToRGB(color)  ; color can use: RRGGBB, Red, Yellow, Black, White
{
  static tab:=""
  if (!tab)
    tab:=Map(), tab.CaseSense:="Off"
    , tab.Set("Black", "000000", "White", "FFFFFF"
    , "Red", "FF0000", "Green", "008000", "Blue", "0000FF"
    , "Yellow", "FFFF00", "Silver", "C0C0C0", "Gray", "808080"
    , "Teal", "008080", "Navy", "000080", "Aqua", "00FFFF"
    , "Olive", "808000", "Lime", "00FF00", "Fuchsia", "FF00FF"
    , "Purple", "800080", "Maroon", "800000")
  return this.Floor("0x" (tab.Has(color)?tab[color]:color))
}

GetBitsFromScreen(&x:=0, &y:=0, &w:=0, &h:=0
  , ScreenShot:=1, &zx:=0, &zy:=0, &zw:=0, &zh:=0)
{
  static CAPTUREBLT:=""
  if (CAPTUREBLT="")  ; thanks Descolada
  {
    DllCall("Dwmapi\DwmIsCompositionEnabled", "Int*", &i:=0)
    CAPTUREBLT:=i ? 0 : 0x40000000
  }
  if InStr(A_OSVersion, ".")  ; thanks QQ:349029755
    Try DllCall("SetThreadDpiAwarenessContext", "Ptr",-3, "Ptr")
  (!IsObject(this.bits) && this.bits:={Scan0:0, hBM:0, oldzw:0, oldzh:0})
  , bits:=this.bits
  if (!ScreenShot && bits.Scan0)
  {
    zx:=bits.zx, zy:=bits.zy, zw:=bits.zw, zh:=bits.zh
    , w:=Min(x+w,zx+zw), x:=Max(x,zx), w-=x
    , h:=Min(y+h,zy+zh), y:=Max(y,zy), h-=y
    return bits
  }
  cri:=A_IsCritical
  Critical
  bits.BindWindow:=id:=this.BindWindow(0,0,1)
  if (id)
  {
    Try
      WinGetPos &zx, &zy, &zw, &zh, id
    Catch
      id:=0
  }
  if (!id)
  {
    zx:=SysGet(76)
    , zy:=SysGet(77)
    , zw:=SysGet(78)
    , zh:=SysGet(79)
  }
  this.UpdateBits(bits, zx, zy, zw, zh)
  , w:=Min(x+w,zx+zw), x:=Max(x,zx), w-=x
  , h:=Min(y+h,zy+zh), y:=Max(y,zy), h-=y
  if (!ScreenShot || w<1 || h<1 || !bits.hBM)
  {
    Critical cri
    return bits
  }
  if IsSet(GetBitsFromScreen2) && (GetBitsFromScreen2 is Func)
    && GetBitsFromScreen2(bits, x-zx, y-zy, w, h)
  {
    ; Get the bind window use bits.BindWindow
    ; Each small range of data obtained from DXGI must be
    ; copied to the screenshot cache using FindText().CopyBits()
    zx:=bits.zx, zy:=bits.zy, zw:=bits.zw, zh:=bits.zh
    Critical cri
    return bits
  }
  mDC:=DllCall("CreateCompatibleDC", "Ptr",0, "Ptr")
  oBM:=DllCall("SelectObject", "Ptr",mDC, "Ptr",bits.hBM, "Ptr")
  if (id)
  {
    if (mode:=this.BindWindow(0,0,0,1))<2
    {
      hDC:=DllCall("GetDCEx", "Ptr",id, "Ptr",0, "int",3, "Ptr")
      DllCall("BitBlt","Ptr",mDC,"int",x-zx,"int",y-zy,"int",w,"int",h
        , "Ptr",hDC, "int",x-zx, "int",y-zy, "uint",0xCC0020|CAPTUREBLT)
      DllCall("ReleaseDC", "Ptr",id, "Ptr",hDC)
    }
    else
    {
      hBM2:=this.CreateDIBSection(zw, zh)
      mDC2:=DllCall("CreateCompatibleDC", "Ptr",0, "Ptr")
      oBM2:=DllCall("SelectObject", "Ptr",mDC2, "Ptr",hBM2, "Ptr")
      DllCall("UpdateWindow", "Ptr",id)
      ; RDW_INVALIDATE=0x1|RDW_ERASE=0x4|RDW_ALLCHILDREN=0x80|RDW_FRAME=0x400
      ; DllCall("RedrawWindow", "Ptr",id, "Ptr",0, "Ptr",0, "uint", 0x485)
      DllCall("PrintWindow", "Ptr",id, "Ptr",mDC2, "uint",(mode>3)*3)
      DllCall("BitBlt","Ptr",mDC,"int",x-zx,"int",y-zy,"int",w,"int",h
        , "Ptr",mDC2, "int",x-zx, "int",y-zy, "uint",0xCC0020)
      DllCall("SelectObject", "Ptr",mDC2, "Ptr",oBM2)
      DllCall("DeleteDC", "Ptr",mDC2)
      DllCall("DeleteObject", "Ptr",hBM2)
    }
  }
  else
  {
    hDC:=DllCall("GetWindowDC","Ptr",id:=DllCall("GetDesktopWindow","Ptr"),"Ptr")
    DllCall("BitBlt","Ptr",mDC,"int",x-zx,"int",y-zy,"int",w,"int",h
      , "Ptr",hDC, "int",x, "int",y, "uint",0xCC0020|CAPTUREBLT)
    DllCall("ReleaseDC", "Ptr",id, "Ptr",hDC)
  }
  if this.CaptureCursor(0,0,0,0,0,1)
    this.CaptureCursor(mDC, zx, zy, zw, zh)
  DllCall("SelectObject", "Ptr",mDC, "Ptr",oBM)
  DllCall("DeleteDC", "Ptr",mDC)
  Critical cri
  return bits
}

UpdateBits(bits, zx, zy, zw, zh)
{
  if (zw>bits.oldzw || zh>bits.oldzh || !bits.hBM)
  {
    Try DllCall("DeleteObject", "Ptr",bits.hBM)
    bits.hBM:=this.CreateDIBSection(zw, zh, bpp:=32, &ppvBits)
    , bits.Scan0:=(!bits.hBM ? 0:ppvBits)
    , bits.Stride:=((zw*bpp+31)//32)*4
    , bits.oldzw:=zw, bits.oldzh:=zh
  }
  bits.zx:=zx, bits.zy:=zy, bits.zw:=zw, bits.zh:=zh
}

CreateDIBSection(w, h, bpp:=32, &ppvBits:=0)
{
  NumPut("int",40, "int",w, "int",-h, "short",1, "short",bpp, bi:=Buffer(40,0))
  return DllCall("CreateDIBSection", "Ptr",0, "Ptr",bi
    , "int",0, "Ptr*",&ppvBits:=0, "Ptr",0, "int",0, "Ptr")
}

GetBitmapWH(hBM, &w, &h)
{
  bm:=Buffer(size:=(A_PtrSize=8 ? 32:24), 0)
  , DllCall("GetObject", "Ptr",hBM, "int",size, "Ptr",bm)
  , w:=NumGet(bm,4,"int"), h:=Abs(NumGet(bm,8,"int"))
}

CopyHBM(hBM1, x1, y1, hBM2, x2, y2, w, h, Clear:=0)
{
  if (w<1 || h<1 || !hBM1 || !hBM2)
    return
  mDC1:=DllCall("CreateCompatibleDC", "Ptr",0, "Ptr")
  oBM1:=DllCall("SelectObject", "Ptr",mDC1, "Ptr",hBM1, "Ptr")
  mDC2:=DllCall("CreateCompatibleDC", "Ptr",0, "Ptr")
  oBM2:=DllCall("SelectObject", "Ptr",mDC2, "Ptr",hBM2, "Ptr")
  DllCall("BitBlt", "Ptr",mDC1, "int",x1, "int",y1, "int",w, "int",h
  , "Ptr",mDC2, "int",x2, "int",y2, "uint",0xCC0020)
  if (Clear)
    DllCall("BitBlt", "Ptr",mDC1, "int",x1, "int",y1, "int",w, "int",h
    , "Ptr",mDC1, "int",x1, "int",y1, "uint",MERGECOPY:=0xC000CA)
  DllCall("SelectObject", "Ptr",mDC1, "Ptr",oBM1)
  DllCall("DeleteDC", "Ptr",mDC1)
  DllCall("SelectObject", "Ptr",mDC2, "Ptr",oBM2)
  DllCall("DeleteDC", "Ptr",mDC2)
}

CopyBits(Scan01,Stride1,x1,y1,Scan02,Stride2,x2,y2,w,h,Reverse:=0)
{
  if (w<1 || h<1 || !Scan01 || !Scan02)
    return
  static init:=0, MFCopyImage
  if (!init && init:=1)
  {
    MFCopyImage:=DllCall("GetProcAddress", "Ptr"
    , DllCall("LoadLibrary", "Str","Mfplat.dll", "Ptr")
    , "AStr","MFCopyImage", "Ptr")
  }
  if (MFCopyImage && !Reverse)  ; thanks QQ:121507989
  {
    return DllCall(MFCopyImage
      , "Ptr",Scan01+y1*Stride1+x1*4, "int",Stride1
      , "Ptr",Scan02+y2*Stride2+x2*4, "int",Stride2
      , "uint",w*4, "uint",h)
  }
  ListLines (lls:=A_ListLines)?0:0
  p1:=Scan01+(y1-1)*Stride1+x1*4
  , p2:=Scan02+(y2-1)*Stride2+x2*4, w*=4
  , (Reverse) && (p2+=(h+1)*Stride2, Stride2:=-Stride2)
  Loop h
    DllCall("RtlMoveMemory","Ptr",p1+=Stride1,"Ptr",p2+=Stride2,"Ptr",w)
  ListLines lls
}

; Bind the window so that it can find images when obscured
; by other windows, it's equivalent to always being
; at the front desk. Unbind Window using FindText().BindWindow(0)

BindWindow(bind_id:=0, bind_mode:=0, get_id:=0, get_mode:=0)
{
  (!IsObject(this.bind) && this.bind:={id:0, mode:0, oldStyle:0})
  , bind:=this.bind
  if (get_id)
    return bind.id
  if (get_mode)
    return bind.mode
  if (bind_id)
  {
    bind.id:=bind_id:=this.Floor(bind_id)
    , bind.mode:=bind_mode, bind.oldStyle:=0
    if (bind_mode & 1)
    {
      i:=WinGetExStyle(bind_id)
      bind.oldStyle:=i
      WinSetTransparent(255, bind_id)
      Loop 30
      {
        Sleep 100
        i:=WinGetTransparent(bind_id)
      }
      Until (i=255)
    }
  }
  else
  {
    bind_id:=bind.id
    if (bind.mode & 1)
      WinSetExStyle(bind.oldStyle, bind_id)
    bind.id:=0, bind.mode:=0, bind.oldStyle:=0
  }
}

; Use FindText().CaptureCursor(1) to Capture Cursor
; Use FindText().CaptureCursor(0) to Cancel Capture Cursor

CaptureCursor(hDC:=0, zx:=0, zy:=0, zw:=0, zh:=0, get_cursor:=0)
{
  if (get_cursor)
    return this.Cursor
  if (hDC=1 || hDC=0) && (zw=0)
  {
    this.Cursor:=hDC
    return
  }
  mi:=Buffer(40, 0), NumPut("int", 16+A_PtrSize, mi)
  DllCall("GetCursorInfo", "Ptr",mi)
  bShow:=NumGet(mi, 4, "int")
  hCursor:=NumGet(mi, 8, "Ptr")
  x:=NumGet(mi, 8+A_PtrSize, "int")
  y:=NumGet(mi, 12+A_PtrSize, "int")
  if (!bShow) || (x<zx || y<zy || x>=zx+zw || y>=zy+zh)
    return
  ni:=Buffer(40, 0)
  DllCall("GetIconInfo", "Ptr",hCursor, "Ptr",ni)
  xCenter:=NumGet(ni, 4, "int")
  yCenter:=NumGet(ni, 8, "int")
  hBMMask:=NumGet(ni, (A_PtrSize=8?16:12), "Ptr")
  hBMColor:=NumGet(ni, (A_PtrSize=8?24:16), "Ptr")
  DllCall("DrawIconEx", "Ptr",hDC
    , "int",x-xCenter-zx, "int",y-yCenter-zy, "Ptr",hCursor
    , "int",0, "int",0, "int",0, "int",0, "int",3)
  DllCall("DeleteObject", "Ptr",hBMMask)
  DllCall("DeleteObject", "Ptr",hBMColor)
}

MCode(hex)
{
  flag:=((hex~="[^A-Fa-f\d\s]") ? 1:4), len:=0
  Loop 2
    if !DllCall("crypt32\CryptStringToBinary", "Str",hex, "uint",0, "uint",flag
    , "Ptr",(A_Index=1?0:(p:=Buffer(len)).Ptr), "uint*",&len, "Ptr",0, "Ptr",0)
      return
  if DllCall("VirtualProtect", "Ptr",p.Ptr, "Ptr",len, "uint",0x40, "uint*",0)
    return p
}

bin2hex(addr, size, base64:=0)
{
  flag:=(base64 ? 1:4)|0x40000000, len:=0
  Loop 2
    DllCall("crypt32\CryptBinaryToString", "Ptr",addr, "uint",size, "uint",flag
    , "Ptr",(A_Index=1?0:(p:=Buffer(len*2)).Ptr), "uint*",&len)
  return RegExReplace(StrGet(p.Ptr, len), "\s+")
}

base64tobit(s)
{
  ListLines (lls:=A_ListLines)?0:0
  Chars:="0123456789+/ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
  Loop Parse, Chars
    if InStr(s, A_LoopField, 1)
      s:=RegExReplace(s, "[" A_LoopField "]", ((i:=A_Index-1)>>5&1)
      . (i>>4&1) . (i>>3&1) . (i>>2&1) . (i>>1&1) . (i&1))
  s:=RegExReplace(RegExReplace(s,"[^01]+"),"10*$")
  ListLines lls
  return s
}

bit2base64(s)
{
  ListLines (lls:=A_ListLines)?0:0
  s:=RegExReplace(s,"[^01]+")
  s.=SubStr("100000",1,6-Mod(StrLen(s),6))
  s:=RegExReplace(s,".{6}","|$0")
  Chars:="0123456789+/ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
  Loop Parse, Chars
    s:=StrReplace(s, "|" . ((i:=A_Index-1)>>5&1)
    . (i>>4&1) . (i>>3&1) . (i>>2&1) . (i>>1&1) . (i&1), A_LoopField)
  ListLines lls
  return s
}

ASCII(s)
{
  if RegExMatch(s, "\$(\d+)\.([\w+/]+)", &r)
  {
    s:=RegExReplace(this.base64tobit(r[2]),".{" r[1] "}","$0`n")
    s:=StrReplace(StrReplace(s,"0","_"),"1","0")
  }
  else s:=""
  return s
}

; You can put the text library at the beginning of the script,
; and Use FindText().PicLib(Text,1) to add the text library to PicLib()'s Lib,
; Use FindText().PicLib("comment1|comment2|...") to get text images from Lib

PicLib(comments, add_to_Lib:=0, index:=1)
{
  (!IsObject(this.Lib) && this.Lib:=Map()), Lib:=this.Lib
  , (!Lib.Has(index) && Lib[index]:=Map()), Lib:=Lib[index]
  if (add_to_Lib)
  {
    re:="<([^>\n]*)>[^$\n]+\$[^`"'\r\n]+"
    Loop Parse, comments, "|"
      if RegExMatch(A_LoopField, re, &r)
      {
        s1:=Trim(r[1]), s2:=""
        Loop Parse, s1
          s2.=Format("_{:d}", Ord(A_LoopField))
        (s2!="") && Lib[s2]:=r[0]
      }
  }
  else
  {
    Text:=""
    Loop Parse, comments, "|"
    {
      s1:=Trim(A_LoopField), s2:=""
      Loop Parse, s1
        s2.=Format("_{:d}", Ord(A_LoopField))
      (Lib.Has(s2)) && Text.="|" Lib[s2]
    }
    return Text
  }
}

; Screenshot and retained as the last screenshot.

ScreenShot(x1:=0, y1:=0, x2:=0, y2:=0)
{
  this.FindText(,, x1, y1, x2, y2)
}

; Get the RGB color of a point from the last screenshot.
; If the point to get the color is beyond the range of
; Screen, it will return White color (0xFFFFFF).

GetColor(x, y, fmt:=1)
{
  bits:=this.GetBitsFromScreen(,,,,0,&zx,&zy,&zw,&zh), x-=zx, y-=zy
  , c:=(x>=0 && x<zw && y>=0 && y<zh && bits.Scan0)
  ? NumGet(bits.Scan0+y*bits.Stride+x*4,"uint") : 0xFFFFFF
  return (fmt ? Format("0x{:06X}",c&0xFFFFFF) : c)
}

; Set the RGB color of a point in the last screenshot

SetColor(x, y, color:=0x000000)
{
  bits:=this.GetBitsFromScreen(,,,,0,&zx,&zy,&zw,&zh), x-=zx, y-=zy
  if (x>=0 && x<zw && y>=0 && y<zh && bits.Scan0)
    NumPut("uint", color, bits.Scan0+y*bits.Stride+x*4)
}

; Identify a line of text or verification code
; based on the result returned by FindText().
; offsetX is the maximum interval between two texts,
; if it exceeds, a "*" sign will be inserted.
; offsetY is the maximum height difference between two texts.
; overlapW is used to set the width of the overlap.
; Return Association array {text:Text, x:X, y:Y, w:W, h:H}

Ocr(ok, offsetX:=20, offsetY:=20, overlapW:=0)
{
  ocr_Text:=ocr_X:=ocr_Y:=min_X:=dx:=""
  For k,v in ok
    x:=v.1
    , min_X:=(A_Index=1 || x<min_X ? x : min_X)
    , max_X:=(A_Index=1 || x>max_X ? x : max_X)
  While (min_X!="" && min_X<=max_X)
  {
    LeftX:=""
    For k,v in ok
    {
      x:=v.1, y:=v.2
      if (x<min_X) || (ocr_Y!="" && Abs(y-ocr_Y)>offsetY)
        Continue
      ; Get the leftmost X coordinates
      if (LeftX="" || x<LeftX)
        LeftX:=x, LeftY:=y, LeftW:=v.3, LeftH:=v.4, LeftOCR:=v.id
    }
    if (LeftX="")
      Break
    if (ocr_X="")
      ocr_X:=LeftX, min_Y:=LeftY, max_Y:=LeftY+LeftH
    ; If the interval exceeds the set value, add "*" to the result
    ocr_Text.=(ocr_Text!="" && LeftX>dx ? "*":"") . LeftOCR
    ; Update for next search
    min_X:=LeftX+LeftW-(overlapW>LeftW//2 ? LeftW//2:overlapW)
    , dx:=LeftX+LeftW+offsetX, ocr_Y:=LeftY
    , (LeftY<min_Y && min_Y:=LeftY)
    , (LeftY+LeftH>max_Y && max_Y:=LeftY+LeftH)
  }
  (ocr_X="") && ocr_X:=min_Y:=min_X:=max_Y:=0
  return {text:ocr_Text, x:ocr_X, y:min_Y, w:min_X-ocr_X, h:max_Y-min_Y}
}

; Sort the results of FindText() from left to right
; and top to bottom, ignore slight height difference

Sort(ok, dy:=10)
{
  if !IsObject(ok)
    return ok
  s:="", n:=150000, ypos:=[]
  For k,v in ok
  {
    x:=v.x, y:=v.y, add:=1
    For k1,v1 in ypos
    if Abs(y-v1)<=dy
    {
      y:=v1, add:=0
      Break
    }
    if (add)
      ypos.Push(y)
    s.=(y*n+x) "." k "|"
  }
  s:=Trim(s,"|")
  s:=Sort(s, "N D|")
  ok2:=[]
  For k,v in StrSplit(s,"|")
    ok2.Push(ok[SubStr(v,InStr(v,".")+1)])
  return ok2
}

; Sort the results of FindText() according to the nearest distance

Sort2(ok, px, py)
{
  if !IsObject(ok)
    return ok
  s:=""
  For k,v in ok
    s.=((v.x-px)**2+(v.y-py)**2) "." k "|"
  s:=Trim(s,"|")
  s:=Sort(s, "N D|")
  ok2:=[]
  For k,v in StrSplit(s,"|")
    ok2.Push(ok[SubStr(v,InStr(v,".")+1)])
  return ok2
}

; Sort the results of FindText() according to the search direction

Sort3(ok, dir:=1)
{
  if !IsObject(ok)
    return ok
  s:="", n:=150000
  For k,v in ok
    x:=v.1, y:=v.2
    , s.=(dir=1 ? y*n+x
    : dir=2 ? y*n-x
    : dir=3 ? -y*n+x
    : dir=4 ? -y*n-x
    : dir=5 ? x*n+y
    : dir=6 ? x*n-y
    : dir=7 ? -x*n+y
    : dir=8 ? -x*n-y : y*n+x) "." k "|"
  s:=Trim(s,"|")
  s:=Sort(s, "N D|")
  ok2:=[]
  For k,v in StrSplit(s,"|")
    ok2.Push(ok[SubStr(v,InStr(v,".")+1)])
  return ok2
}

State(key)
{
  return GetKeyState(key,"P") || GetKeyState(key)
}

Click(x:="", y:="", other1:="", other2:="", GoBack:=0)
{
  CoordMode "Mouse", (bak:=A_CoordModeMouse)?"Screen":"Screen"
  if GoBack
    MouseGetPos &oldx, &oldy
  MouseMove x, y, 0
  Sleep 30
  Click x "," y "," other1 "," other2
  if GoBack
    MouseMove oldx, oldy, 0
  CoordMode "Mouse", bak
  return 1
}

; Running AHK code dynamically with new threads

Class Thread
{
  __New(args*)
  {
    this.pid:=this.Exec(args*)
  }
  __Delete()
  {
    ProcessClose this.pid
  }
  Exec(s, Ahk:="", args:="")    ; required AHK v1.1.34+ and Ahk2Exe Use .exe
  {
    Ahk:=Ahk ? Ahk : A_IsCompiled ? A_ScriptFullPath : A_AhkPath
    s:="`nDllCall(`"SetWindowText`",`"Ptr`",A_ScriptHwnd,`"Str`",`"<AHK>`")`n"
      . "`n`n" . s, s:=RegExReplace(s, "\R", "`r`n")
    Try
    {
      shell:=ComObject("WScript.Shell")
      oExec:=shell.Exec("`"" Ahk "`" /script /force /CP0 * " args)
      oExec.StdIn.Write(s)
      oExec.StdIn.Close(), pid:=oExec.ProcessID
    }
    Catch
    {
      f:=A_Temp "\~ahk.tmp"
      s:="`r`nTry FileDelete `"" f "`"`r`n" s
      Try FileDelete f
      FileAppend s, f
      r:=this.Clear.Bind(this)
      SetTimer r, -3000
      Run "`"" Ahk "`" /script /force /CP0 `"" f "`" " args,,, &pid
    }
    return pid
  }
  Clear()
  {
    Try FileDelete A_Temp "\~ahk.tmp"
    SetTimer(,0)
  }
}


Script_End() {
}

}