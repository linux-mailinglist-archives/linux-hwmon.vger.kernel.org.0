Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 160E255AB2D
	for <lists+linux-hwmon@lfdr.de>; Sat, 25 Jun 2022 17:04:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbiFYPE2 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sat, 25 Jun 2022 11:04:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbiFYPE1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 25 Jun 2022 11:04:27 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E4E23B
        for <linux-hwmon@vger.kernel.org>; Sat, 25 Jun 2022 08:04:26 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id o18so4567797plg.2
        for <linux-hwmon@vger.kernel.org>; Sat, 25 Jun 2022 08:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=npxCWy2DywcBQq9OCNxxK3fUiVjXtjApy10t54oASAI=;
        b=n6oKdnki3fct3gCqGdDUhHcsFCHS5gDy/AWHRPVKlqJgJXrnn2ih2D43vNco12Gnny
         68EJtlEhINuLeHVFlX1SR8GOX9/BWJBM1/t/R66GLqrlASwWvyYU6wsYKg61YqXpywUQ
         1RrcOXaBdPCkNxz/3rfyzKLEJdC9Vj+iYoEdHQRdt7CcTfoWWf+Nrq5nCMROehmtmGyC
         jUaQcH6X04O1IeW2lltCS6cOnOiPXIRTXCshgOAi/1Iwhz0vTGJ6+nOeggC6EERxWlkX
         7BxxyN5MMNIu7bmiyuEGbTz+EJsU9GPZGtTCOuWKeyRs2UtnhqS1OLScRQ7h+FJAB9RG
         bCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=npxCWy2DywcBQq9OCNxxK3fUiVjXtjApy10t54oASAI=;
        b=IZFwahEIC1Cd8MblB4IHDtWJ3xUohq6UzISkcqtFdC/fyVivtBv02RVoCs/eu/5DLK
         Rakgyu4fEoAHoGAgiIXjbsI1KfFArJzPUyK9DSIJYqtRXtsl2RV4GVUgHl32yWMcEFDv
         z0jOdJ2yOYlJP2EJjr/TczPRUwlreSPAZfDxk/zWy3lQmHtijYtz6I6LufOuooRF68Ly
         wBJIJ/KiXTau7W34BNQITyT+PdPMoiPHsnAWeF8OJJkuYwuoGnJ6jfvK722JaRx79xjB
         a0iHRav3W1I6Eq5bsmq/CIE12RV9tTOk8dv7xWwmag37UsFcgfwY5QiBSsNpdwrII/4K
         40Nw==
X-Gm-Message-State: AJIora8pE7T65GPsJ8CkTZxmOS+pb7DNVssbdpxJZ6bmZYYSqMj2+3Q6
        vr7dQYkTYgamHaD6N+2YE4nWsl2ZgzrMnjcLG7c=
X-Google-Smtp-Source: AGRyM1u/AEBb05/ejQD4s91vp17w6W/MmVxCXfJX17jlNiaRYmewz+HmKjGXo9WDUZQaJEHb3TLoY/JZH6gWapN/OmQ=
X-Received: by 2002:a17:90b:1210:b0:1ea:ee10:c823 with SMTP id
 gl16-20020a17090b121000b001eaee10c823mr10140244pjb.109.1656169466339; Sat, 25
 Jun 2022 08:04:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a06:19cd:b0:521:29c4:4456 with HTTP; Sat, 25 Jun 2022
 08:04:25 -0700 (PDT)
Reply-To: abraaahammorrison1980@gmail.com
From:   Abraham Morrison <mrsnancymorrison01@gmail.com>
Date:   Sat, 25 Jun 2022 08:04:25 -0700
Message-ID: <CAHm7iqgZzp+5Y_FebONHkCqbrey-uFQMzjvzyTSOncLjNUr11g@mail.gmail.com>
Subject: Good day!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Aufmerksamkeit bitte,

Ich bin Mr. Abraham Morrison, wie geht es Ihnen, ich hoffe, Sie sind
wohlauf und gesund? Hiermit m=C3=B6chte ich Sie dar=C3=BCber informieren, d=
ass
ich die Transaktion mit Hilfe eines neuen Partners aus Indien
erfolgreich abgeschlossen habe und nun der Fonds nach Indien auf das
Bankkonto des neuen Partners =C3=BCberwiesen wurde.

Inzwischen habe ich mich entschieden, Sie mit der Summe von 500.000,00
=E2=82=AC (nur f=C3=BCnfhunderttausend Euro) f=C3=BCr Ihre bisherigen Bem=
=C3=BChungen zu
entsch=C3=A4digen, obwohl Sie mich auf der ganzen Linie entt=C3=A4uscht hab=
en.
Aber trotzdem freue ich mich sehr =C3=BCber den reibungslosen und
erfolgreichen Abschluss der Transaktion und habe mich daher
entschieden, Sie mit der Summe von 500.000,00 =E2=82=AC zu entsch=C3=A4dige=
n, damit
Sie die Freude mit mir teilen.

Ich rate Ihnen, sich an meine Sekret=C3=A4rin zu wenden, um eine
Bankomatkarte =C3=BCber 500.000,00 =E2=82=AC zu erhalten, die ich f=C3=BCr =
Sie
aufbewahrt habe. Kontaktieren Sie sie jetzt ohne Verz=C3=B6gerung.

Name: Linda Kofi
E-Mail: koffilinda785@gmail.com


Bitte best=C3=A4tigen Sie ihr die folgenden Informationen:

Ihr vollst=C3=A4ndiger Name:........
Deine Adresse:..........
Dein Land:..........
Ihr Alter: .........
Ihr Beruf:..........
Ihre Handynummer: ...........
Ihr Reisepass oder F=C3=BChrerschein:.........

Beachten Sie, dass, wenn Sie ihr die oben genannten Informationen
nicht vollst=C3=A4ndig gesendet haben, sie die Bankomatkarte nicht an Sie
herausgeben wird, da sie sicher sein muss, dass Sie es sind. Bitten
Sie sie, Ihnen den Gesamtbetrag (=E2=82=AC 500.000,00) der Bankomatkarte zu
schicken, die ich f=C3=BCr Sie aufbewahrt habe.

Mit freundlichen Gr=C3=BC=C3=9Fen,

Herr Abraham Morrison
