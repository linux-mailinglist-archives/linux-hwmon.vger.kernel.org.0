Return-Path: <linux-hwmon+bounces-14955-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vJ1ME6wqKWp/RwMAu9opvQ
	(envelope-from <linux-hwmon+bounces-14955-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 11:13:16 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DBB667B3C
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 11:13:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nR2HWt4M;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fy6Sdmbu;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-14955-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-14955-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0BC1831C217D
	for <lists+linux-hwmon@lfdr.de>; Wed, 10 Jun 2026 09:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D42043B3BF5;
	Wed, 10 Jun 2026 09:01:23 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969DA3BB109
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 09:01:22 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082083; cv=pass; b=WhnopQ2rwYZeTCibbCk7KoGr5ew8b6FOgsgThgAuvBA+Ff8INgZbiH18eUIRqIOJjKmq/B7dLL7jhdgf7DBPECukeApSXClh1emkrjr+2Gn6G/sxuvnNDE5mrzxymZwwk0rwiyOe94e87gYToGzloSBTHR9N4pNu5v4fek5jg9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082083; c=relaxed/simple;
	bh=ygdIc/5cpQph1AaBtGCq+v9bKpdzx46UniyIDnMjYws=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YsJgzSuRoU5z9ZQfBx3kTnQ6FVDnDVCZ0silvoBOJF32Fn4ChGluL+hdQs1VI6FCoDQk8oVpC3JyR0bcadn6l3JC0TvgaJvrLKsK8eta2C63YlK1K/0BvXiv4NP2imL8tccY/vTFUwqE+9PnEN2r8wSRRpQSP9Ry11RDThBvTDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nR2HWt4M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fy6Sdmbu; arc=pass smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hsGv3151721
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 09:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DuwQWCKqoAYLblTzhEK4XXI8hT2dlsXNZH8lQTUJcaE=; b=nR2HWt4M3gjNzZQn
	y4goQ+Y4ILHumR7+UOjs8u/yx128NLPk3ij/JkR6mbAvO+asUox2H7uIAuzcbrxZ
	NoICkgA143UJ5xxmikvQzNCjitjoWx/IxHquQNH6OFuycf5YFu+SnQS216b2igDk
	Xqqxb0MRgNEoe9cu/SfYWv0Y+l3d24FtFwS8GGMs1cBbUs6saEz6t63/MCmMQHqt
	bzuk4z/WxhsMGGdmfj3WTenJBza/N8QawmXiewtWccZMwdg72adf0tDLsO8rYd+b
	UMFlifF+wq2mYBL/x+ULAX7CDRmjvstQ5dewzYhhtDoYSkkWfZiAhKTwvtRq0nhS
	SN5SRQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnesmx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 09:01:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9157de5360fso1560418785a.0
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 02:01:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781082081; cv=none;
        d=google.com; s=arc-20240605;
        b=ZoDZSzF4dJodz4eoJvc4Feo+f8JtAc/dNNqFZNWvURhQqrGUpJuB7kmd56TiIpN3XZ
         n+/ZHgQQVamRbOToCDitUKj5L2CHIV6ie44izL29wOG1ebOfiMNYto0fQQcX+KSye7oK
         cSI9QSBRwfN9KN9Ub0Uo3YPGwOKWAgnv81qJR3Cpw5/fvrGQpVRUj1LaNeY7Y0Pe6oSK
         c2Y0uwORa2iINaSVk9H9lEefKshFyOAsmzSANlqzyiPofg+5/4SKfvfvoRQUmZXyFU1B
         f5z3gW11pEqNUMKvkepu68AUbbYHYgQOkfnJRAi+HUb6BB6a6QQ3LGreD95TMcQ6YMpP
         tXEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DuwQWCKqoAYLblTzhEK4XXI8hT2dlsXNZH8lQTUJcaE=;
        fh=HqR9Kbn3hxETvuYb3AUe2f3pBUPWky4ZZiWDYpaU7Y0=;
        b=kOcRmEPyjpEosTh2rBgreQ70P0SqkFALaw1rfiTl9vMU8ub5c6QR6AbfNqAueD7fWJ
         U2Nu6KsKPOv8GI8FfLDAcTXQbjLUtbzsrkL6vZu6NoNaWPpKN8WlSHtKzVj/66zC4+7z
         leobIbz77aTKI/oEHhqGWOqDUeSXHGBlCNyeL7ggpB4fr8Z2qKGPuXNmhWcqm2op+0Fi
         7PcIvN0j6d5pdjmC6TtCM/hds+PQVvT7A04553ig0qsDOcdT0UwVYRuypxHOyDoMqHLW
         cL9FPf5czfQ+Vi8kvgB5n3n43Yb3i8rUx8r5GI+D30720oZoD9GKypogooLJURGE26yi
         J/Jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781082081; x=1781686881; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuwQWCKqoAYLblTzhEK4XXI8hT2dlsXNZH8lQTUJcaE=;
        b=fy6SdmbuZrI4pYRh3IMcc4ao82QqlGN5A/GD2p8E/wHp7Bs6RCI1RuhP/WYib+tUgE
         vdDIOSCrQL4eyBjPujy7H1+RErZvf8foytQU7mKgLFbQy0k7lq00hjRB38SNpYTXLc+r
         kN8GI7lbMxq5DETd6m+ixA41jxq3O+5bRaOFOOL/UDgYcrdI8Pu0gwb6CnQdNvhDYI+R
         x3GtwOUiNAN+BFXzmnZcxblO2zuOP6jyvSKUmisEvRHjoMhcqz/V2yE5CXgNryWiI7Kg
         hpq6CVf6qxOyCKBCvjJ9m0Cv8yIf0RytzNeHRYRLt+sxDZrsSGMTPbrrs0eGF5oCkLLX
         eY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082081; x=1781686881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DuwQWCKqoAYLblTzhEK4XXI8hT2dlsXNZH8lQTUJcaE=;
        b=GkAi4kCqPJii168UhuUvBeKry163Gk5z+d5nK8o0lso81Y/QCZ14ymRDmpPYGLcG0v
         u5S1ckQI4qv+VzhPAvOA+ocZF9LjM6f5g1i+oFhPVLlShbid2Y3bQqdlun7ayMrzGtG1
         0BNX1uzzUbznKyw7jEcDjzh/gTEh1B7+4WJ9YJNcVGxHOtSQVolze3LYfVWqhNmk3ePh
         P8hjkOYM/pJarOnLG2WFdZNcpvjPpCUUMKonST5bEMScepDDX7ujgULvQbrSrslcZ9qw
         XzX8+IAYARQH0YAWQR58tgcaDrYJTVWmhkspRfANJC1bfktaR2TNhxs8qLii/TkaLa6x
         ZCBw==
X-Forwarded-Encrypted: i=1; AFNElJ9h5YB9nlkfFjH7abV3Pguowg/SLD/201k4tH6sHScxNJ0aMQc1FN1NVs7CNRQAqvpvbt4qcK63QT8CEw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9FLL2b1QNKaxPCFRE2gqH2Qnu3GI348M2mN/WkriKt4ECB4H/
	D1hr/g2dkrDX+DOfS6pBzVm1QKOsznUKbqhrIUTbw/IzxUyXO11nJQVXTRAjJT+UAFCDyh/bHqh
	Z2bdQmCk+5+ebwGQ/Bn+Ni1+se3HKkWG/ymODhZXpV8lLGE5ryxDgDo9vI+Nnzv1sziJ15UPnXV
	PmbbtnEhSE6bQNnbryjF4f3QeknI2SZgW6LBCfl6+W
X-Gm-Gg: Acq92OEHMKdfFgRF3EK+NzCmIgV4B3uJhLw/7CAYZ4XkPQ6QCHRmQ0szaxeI8yM7ynk
	rAXMLJMbz7Ct40xN8lbHz3jj5oaJbvHbb9hFuw4qMdsYjcQVml3BMltRBFVuNhe0irG+EVCkEwz
	a2po+O2EJdRKdGCQhkmJrgeBocLrCKieQpzn2yE2wxwnFD3x6FCBK5S0SUDoHifHX46YbncIMbD
	pDdiPd3dtdzPNIh6C6usXSA8kFkfYNALcPx2yFldJ8t0bPkqX3w+tZcseP8mCilfULBA7B+pICk
	1l94KsrrhewOPzhF2hfPsoAJBeiBcXjT
X-Received: by 2002:a05:620a:1714:b0:914:bdfa:c782 with SMTP id af79cd13be357-915ad2f6fc0mr2781876785a.29.1781082080788;
        Wed, 10 Jun 2026 02:01:20 -0700 (PDT)
X-Received: by 2002:a05:620a:1714:b0:914:bdfa:c782 with SMTP id
 af79cd13be357-915ad2f6fc0mr2781872285a.29.1781082080344; Wed, 10 Jun 2026
 02:01:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-monza-ina232-v1-1-925b0d12771b@oss.qualcomm.com> <20260610084110.95B9A1F00893@smtp.kernel.org>
In-Reply-To: <20260610084110.95B9A1F00893@smtp.kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:01:08 +0200
X-Gm-Features: AVVi8Cf101Etup7zdHfqr_Gk04nLmdhi5b2-2xH0c7qSlPjn2aMb_SPkRj0J0gA
Message-ID: <CAFEp6-1j9Mfo42HRUQC42uFZRtLU+O3XNQToHDbtztCcdM3zgA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: hwmon: ina2xx: add ina232 compatible
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: bm1c0zyYarVN722gpL_Xhx_wXVu60YcC
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a2927e1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=FtrjkMYBM3xUHZKazO8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: bm1c0zyYarVN722gpL_Xhx_wXVu60YcC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4NCBTYWx0ZWRfX8BkqQxK6hH5m
 SPPTKzXLWM3yR2sjUSmDtvDUOk39Hfs6E1+74JE5aCwMb/ZkEKX0h/ifG+xX4rlUqN4rAWoCUpy
 3jU1WeQuqd6geRHLHo0jyxhHTeR/dNd7jEcqrZ9TET+FqJ/+/lbPEj9oNSzXrNxoJUvuyoGdjKh
 xrOoIOD1ch1JdWRnoOU7odwr3JFXnAw3AwlAFKW88YQ0HGIdmOs3uAKPWszv3rCGfMxAAmzL/Aq
 M7CiP/G65ThyBX2s8YS0FCwVVQZw9gSqoP09WpndZo7ptIefnHJtuWRzl/TKrQ73rs0hbVOok19
 zQI+H18bzLDGgp8P00HfT9KjV1wgzbgVagKOkTkuO6YS+JL+HXHU1dMkuYsxjWrfSwYfbYmCTJN
 gdWDX5z3ungMMqIOekBcIcfHUPWyDUwh9P+GjwT0IDZLb10ACHUIvbJvVU46ShqNiNk7LYNbGFa
 AAthfP9TutwIALt4lkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14955-lists,linux-hwmon=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-hwmon@vger.kernel.org,m:devicetree@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-hwmon@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-hwmon@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,arduino.cc:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5DBB667B3C

On Wed, Jun 10, 2026 at 10:41=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The `ti,ina232` compatible string was added to the top-level enum=
 but omitted from the existing `if-then` conditional blocks that restrict u=
nsupported properties.
> --
>
> commit 3cd10611f4c71e7280e19fcd316cd7a918042ee6
> Author: Martino Facchin <m.facchin@arduino.cc>
>
> dt-bindings: hwmon: ina2xx: add ina232 compatible
>
> The INA232 is a current/power monitor from Texas Instruments sharing
> the same register map as the other INA2xx.
>
> > diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/D=
ocumentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
> > index 009d78b308596..a30888c9156b9 100644
> > --- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
> > @@ -28,6 +28,7 @@ properties:
> >        - ti,ina228
> >        - ti,ina230
> >        - ti,ina231
> > +      - ti,ina232
>
> [Severity: Low]
> Does this new compatible string need to be added to the allOf conditional
> blocks further down in the schema file?
>
> By omitting ti,ina232 from the exclusion list for
> ti,maximum-expected-current-microamp, the schema might incorrectly allow
> this property for ti,ina232 nodes:
>
> allOf:
>   - if:
>       properties:
>         compatible:
>           contains:
>             enum:
>               - silergy,sq52206
>               ...
>               - ti,ina231
>               - ti,ina234
>               - ti,ina237
>     then:
>       properties:
>         ti,maximum-expected-current-microamp: false
>
> Should ti,ina232 be added alongside ti,ina231 here?
>
> Similarly, ti,ina232 appears to be omitted from the conditional block
> restricting ti,shunt-gain:
>
>   - if:
>       properties:
>         compatible:
>           contains:
>             enum:
>               - silergy,sy24655
>               ...
>               - ti,ina231
>               - ti,ina234
>               - ti,ina260
>     then:
>       properties:
>         ti,shunt-gain: false
>
> Could this weaken schema validation when checking device tree nodes for
> this specific hardware variant?

That's a valid point, will be addressed in v2.

