Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93CAC3F31AF
	for <lists+linux-hwmon@lfdr.de>; Fri, 20 Aug 2021 18:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231685AbhHTQo5 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 20 Aug 2021 12:44:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbhHTQo5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 20 Aug 2021 12:44:57 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3885FC061575
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Aug 2021 09:44:19 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id 61-20020a9d0d430000b02903eabfc221a9so15180112oti.0
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Aug 2021 09:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=bUTjPqIKpreqQbaKSMRtlmP8DIXR1kRfa9R3KLCDcAU=;
        b=GUcku5y/QAsHl/QXQjjl4cRc6p3rmTWhTnRToRXVNhx4XS/pnVB9D3TuebeLDhw7fu
         U2KxG/K3ksERmh7d0U5RfbCS/gIu0PX0Yf/gngI+QjB6KI5ZCPn9Tcp+PupPjxHaDLXh
         ZqLKOJMS+cdklsKfeTLnrdO1fVyfyuzFuRi+KGq2xAUg1SDw611eWkdWPLCnCLVZtm/p
         LwncHdrZ+JYfi+Sib1ZFIwbaex8HYS50C2qjhD0yYo6XnmdBGuZHJ3SDBC1G0GkTk1sq
         WbOGo9uTW6kGWtMBH1I5SphBnUTncLR8fO5VYKmnOz518MbLdPd+ZPZB6vttFNgQjoKH
         nA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=bUTjPqIKpreqQbaKSMRtlmP8DIXR1kRfa9R3KLCDcAU=;
        b=j8n4sWAD+Ni36m3rjWWEbxk+aO/DhN6n7nAvGGsesmgYkpYIWvtl7dBshkd0SUS02u
         qLcuYW7xpqxWkoCBeCh/1toSxW4whBw3U0kGrFnmjVQtlJ6S0XjRp/SSU1FLn3OM98wq
         QEVqE9M2/7sA4DAEtNWtWL8pDHo+ImK10wWct9zvDqPitjgrT5gIkZ8ZkrdJS9u9JLbj
         StWvr8XfkA97KZRPvniWZ7cmM+uT+RrpmVXbpT3IZnr7RxjgXWnAz9+TYITu8RPYhD3t
         DhpYyEU552T72JCG0ECVh7/K8I/eJThah+/RDUwSqOnMhOLw3Sq68thNFt0no7A2I2bN
         zVbA==
X-Gm-Message-State: AOAM532jUAiaUUhZ2m70sx/cZUiLJWFAQ8Nn2ONuv1zyQm+bUtIuaB2W
        OQ1K39n6yq4MVpdmNJ7sdEjmtH3CKM83OtOFqsU=
X-Google-Smtp-Source: ABdhPJyY/76/jRmnAHjvHKOFUAlEYgsOXNrFinc1KFZh0Br+1chUh+IKaJwWZAredNmsflMAx38o98kLBI7B/rAZhGQ=
X-Received: by 2002:a05:6808:aaa:: with SMTP id r10mr3069589oij.95.1629477858667;
 Fri, 20 Aug 2021 09:44:18 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sgtkalamanthey@gmail.com
Sender: akpenealeobouna@gmail.com
Received: by 2002:a4a:b905:0:0:0:0:0 with HTTP; Fri, 20 Aug 2021 09:44:18
 -0700 (PDT)
From:   Kayla Manthey <sgtkalamanthey@gmail.com>
Date:   Fri, 20 Aug 2021 16:44:18 +0000
X-Google-Sender-Auth: Nype_Kugm44heTBQq0VZjfsM-Ow
Message-ID: <CAMaApwAH=JZq297W15YJ+b+aPHDcC6mU1ftr1ZVSQdzvgdX+Ow@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Dobr=C3=BD de=C5=88, videli ste moje dve predch=C3=A1dzaj=C3=BAce spr=C3=A1=
vy? pros=C3=ADm
skontroluj a ozvi sa mi v=C4=8Faka.
