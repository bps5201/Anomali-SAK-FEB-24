SELECT art.level_3_code                                                                    AS KODE_KEC,
       art.level_3_name                                                                    AS KEC,
       art.level_4_code                                                                    AS KODE_DESA,
       art.level_4_name                                                                    AS DESA,
       art.level_5_code                                                                    AS BS,
       art.level_6_code                                                                    AS NKS,
       r_root.no_dsrt                                                                      AS DSRT,
       art.index1                                                                          AS NO_ART,
       art.b4k2                                                                            AS NAMA_ART,
       CONCAT(
       -- Anomali B9
       CASE WHEN(
          art.b4k5_value=2  
       ) THEN 'B9,' END,
       -- Anomali B10
       CASE WHEN(
          art.b4k11>0 and (ibu.b4k10-art.b4k10)<12 
       ) THEN 'B10,' END,
       -- Anomali B11
       CASE WHEN(
          len(r51.b5r3a)=16 and (art.b4k9_bln != cast(substring(r51.b5r3a,9,2)as int) OR substring(art.b4k9_thn,3,2) !=  substring(r51.b5r3a,11,2))
       ) THEN 'B11,' END,
       -- Anomali B12
       CASE WHEN(
          r51.b5r3b_value=4
       ) THEN 'B12,' END,
       -- Anomali B13
       CASE WHEN(
          r51.b5r4_value>1 and art.b4k10<15
       ) THEN 'B13,' END,
       -- Anomali B14
       CASE WHEN(
          (art.b4k3_value=2 or art.b4k3_value=5 or art.b4k3_value=7) and r51.b5r5_value=2
       ) THEN 'B14,' END,
       -- Anomali B15
       CASE WHEN(
          art.b4k10>=40 and r51.b5r5_value=2
       ) THEN 'B15,' END,
       -- Anomali B16
       CASE WHEN(
          art.b4k10<7 and r51.b5r5_value=3
       ) THEN 'B16,' END,
       -- Anomali B17
       CASE WHEN(
          r51.b5r6a_value=2 AND (CAST(r51.b5r6c_thn AS int)-CAST(art.b4k9_thn AS INT))>14
       ) THEN 'B17,' END,
       -- Anomali B18
       CASE WHEN(
          r51.b5r6a_value=3 AND (CAST(r51.b5r6c_thn AS int)-CAST(art.b4k9_thn AS INT))>17
       ) THEN 'B18,' END,
       CASE WHEN(
       -- Anomali B19
          r51.b5r6a_value in (4,5,6) AND (CAST(r51.b5r6c_thn AS int)-CAST(art.b4k9_thn AS INT))>20
       ) THEN 'B19,' END,
       CASE WHEN(
       -- Anomali B20
          r51.b5r6a_value >=7 AND (CAST(r51.b5r6c_thn AS int)-CAST(art.b4k9_thn AS INT))>40
       ) THEN 'B20,' END,
        CASE WHEN(
       -- Anomali B21
          r51.b5r6a_value=2 AND (CAST(r51.b5r6c_thn AS int)-CAST(art.b4k9_thn AS INT))<10
       ) THEN 'B21,' END,
       CASE WHEN(
       -- Anomali B22
          r51.b5r6a_value=3 AND (CAST(r51.b5r6c_thn AS int)-CAST(art.b4k9_thn AS INT))<13
       ) THEN 'B22,' END,
       CASE WHEN(
       -- Anomali B23
          r51.b5r6a_value in (4,5,6) AND (CAST(r51.b5r6c_thn AS int)-CAST(art.b4k9_thn AS INT))<16
       ) THEN 'B23,' END,
       CASE WHEN(
       -- Anomali B24
          r51.b5r6a_value=7 AND (CAST(r51.b5r6c_thn AS int)-CAST(art.b4k9_thn AS INT))<17
       ) THEN 'B24,' END,
       CASE WHEN(
       -- Anomali B25
          r51.b5r6a_value in (8,9) AND (CAST(r51.b5r6c_thn AS int)-CAST(art.b4k9_thn AS INT))<20
       ) THEN 'B25,' END,
       CASE WHEN(
       -- Anomali B26
          r51.b5r6a_value in (10,11,12) AND (CAST(r51.b5r6c_thn AS int)-CAST(art.b4k9_thn AS INT))<21
       ) THEN 'B26,' END,
       CASE WHEN(
       -- Anomali B27
          r51.b5r6b_p_value in(3,4)
       ) THEN 'B27,' END,
       CASE WHEN(
       -- Anomali B28
          art.b4k10 < 15 and r51.b5r6d_value = 1
       ) THEN 'B28,' END,
       CASE WHEN(
       -- Anomali B29
          r53.b5r13a_value = 4 and r51.b5r6d_value = 2 and r53.b5r14a_value between 84000 and 88999
       ) THEN 'B29,' END,
       CASE WHEN(
       -- Anomali B30
          art.b4k10 >= 50
          AND r51.b5r6h_value = 1
       ) THEN 'B30,' END,
       CASE WHEN(
       -- Anomali B31
          art.b4k10 >= 50
          AND r51.b5r6h_value = 1
       ) THEN 'B31,' END,
       CASE WHEN(
       -- Anomali B33
          art.b4k10 >= 50
          AND r51.b5r6h_value = 1
       ) THEN 'B33,' END,
       CASE WHEN(
       -- Anomali B35
          art.b4k10 < 7 and (r52.b5r8a_value < 3 or r52.b5r8c_value < 3 or r52.b5r8e_value < 3) AND ((r52.b5r8b_value between 5 and 6 ) or (r52.b5r8d_value between 5 and 6 ) or 
          (r52.b5r8f_value between 5 and 6 ))
       ) THEN 'B35,' END,
       CASE WHEN(
          -- Anomali B37
          art.b4k3_value = 1   AND
          r52.b5r9a_value = 2 AND 
          r52.b5r9b_value = 2 AND 
          r52.b5r9c_value = 2 AND
          r52.b5r10_value = 2
       ) THEN 'B37,' END,
       CASE WHEN(
          -- Anomali B38
         (cast(r53.b5r17a_thn as int) - cast(art.b4k9_thn as int)) < 10
       ) THEN 'B38,' END,
       CASE WHEN(
          -- Anomali B44
         art.b4k3_value =1 AND
       art.b4k10 <= 50
        and (r52.b5r9a_value = 2 OR r52.b5r9b_value = 2 OR r52.b5r9c_value = 2 OR r52.b5r10_value =2)
       and (r52.b5r8a_value > 2 OR
       r52.b5r8b_value > 6 OR
       r52.b5r8c_value > 2 OR
       r52.b5r8d_value > 6 OR
       r52.b5r8e_value > 2 OR
       r52.b5r8f_value > 6 )
    AND r56.b5r37a_value = 2    
       ) THEN 'B44,' END,
       CASE WHEN(
          -- Anomali B45
         r52.b5r11a_value = 8
       ) THEN 'B45,' END,
       CASE WHEN(
          -- Anomali B48
         art.b4k10 <= 17
         and r53.b5r13a_value <= 4
       ) THEN 'B48,' END,
       CASE WHEN(
          -- Anomali B50
         r53.b5r13a_value = 3
         and (CAST(r53.b5r14a_value as INT) between '01111' and '03279')
       ) THEN 'B50,' END,
       CASE WHEN(
          -- Anomali B53
         r53.b5r13a_value < 7
         and r53.b5r15_1 + r53.b5r15_2 < 100000
       ) THEN 'B53,' END,
       CASE WHEN(
          -- Anomali B54
         r53.b5r15_1 + r53.b5r15_2 > 7000000
       ) THEN 'B54,' END,
       CASE WHEN(
          -- Anomali B57
         art.b4k3_value = 1
         and r53.b5r15_1 + r53.b5r15_2 < 500000
         and r53.b5r18a_jml < 25
         and r54.b5r28_value = 2
       ) THEN 'B57,' END,
        CASE WHEN(
          -- Anomali B60
         r53.b5r13a_value = 4
         AND (r53.b5r16b_value = 3 OR r53.b5r16b_value = 4)
       ) THEN 'B60,' END,
       CASE WHEN(
          -- Anomali B65
         (art_5th_3_roster.b5r14a_value between 10000 and 33999
         or
        art_5th_3_roster.b5r14a_value between 45000 and 56999)
        AND
        art_5th_3_roster.b5r19a1_value = 2 and 
        art_5th_3_roster.b5r19a2_value = 4 and
        art_5th_3_roster.b5r19a3_value = 2
       ) THEN 'B65,' END,
       CASE WHEN(
          -- Anomali B66
         art_5th_3_roster.b5r14a_value between 69000 and 84999
          and 
          art_5th_3_roster.b5r19b_value = 2
       ) THEN 'B66,' END,
       CASE WHEN(
          -- Anomali B67
         art_5th_3_roster.b5r14a_value between 85000 and 87999
         and art_5th_3_roster.b5r19b_value = 2
       ) THEN 'B67,' END,
       CASE WHEN(
          -- Anomali B68
         (art_5th_3_roster.b5r14a_value between 10000 and 33999
         or art_5th_3_roster.b5r14a_value between 45000 and 56999)
         and art_5th_3_roster.b5r19b_value = 2        
       ) THEN 'B68,' END,
       CASE WHEN(
          -- Anomali B69
         art_5th_3_roster.b5r13a_value >= 5 and
         art_5th_3_roster.b5r20_value <= 3   
       ) THEN 'B69,' END,
       CASE WHEN(
          -- Anomali B70
         art_5th_3_roster.b5r20_value = 5
       ) THEN 'B70,' END,
       CASE WHEN(
          -- Anomali B71
         (art_5th_3_roster.b5r14a_value between 64000  and 85999 )
         and (art_5th_3_roster.b5r21_value = 1 or art_5th_3_roster.b5r21_value =  2)
       ) THEN 'B71,' END,
       CASE WHEN(
          -- Anomali B72
         (art_5th_3_roster.b5r20_value = 2
         or art_5th_3_roster.b5r20_value =  3)
         and art_5th_3_roster.b5r21_value = 1
       ) THEN 'B72,' END,
       CASE WHEN(
          -- Anomali B75
         (art_5th_3_roster.b5r14a_value between 01000 and 03999)
         and
         art_5th_3_roster.b5r22a_value = 1
       ) THEN 'B75,' END,
       CASE WHEN(
          -- Anomali B79
         art_5th_3_roster.b5r13a_value = 4  and
         art_5th_3_roster.b5r23b_value > 1
       ) THEN 'B79,' END,
       CASE WHEN(
          -- Anomali B80
         (art_5th_3_roster.b5r13a_value = 5 or art_5th_3_roster.b5r13a_value =  6 ) and art_5th_3_roster.b5r23a3_value = 1 or art_5th_3_roster.b5r23a7_value=1
       ) THEN 'B80,' END,
       CASE WHEN(
          -- Anomali B81
         art_5th_3_roster.b5r23b_value=5
       ) THEN 'B81,' END,
       CASE WHEN(
          -- Anomali B85
         (art_5th_3_roster.b5r13a_value = 4 or art_5th_3_roster.b5r13a_value = 5 or art_5th_3_roster.b5r13a_value = 6 ) and art_5th_3_roster.b5r25a_value = 4
       ) THEN 'B85,' END,
       CASE WHEN(
          -- Anomali B87
         art_5th_3_roster.b5r13a_value=5 or art_5th_3_roster.b5r13a_value = 6 and art_5th_3_roster.b5r26_value=1
       ) THEN 'B87,' END,
       CASE WHEN(
          -- Anomali B90
         art_5th_4_roster.b5r32a_value between 01000 and 03999 AND art_5th_4_roster.b5r28_value = 1 and art_5th_4_roster.b5r31a_value = 3 
       ) THEN 'B90,' END,
       CASE WHEN(
          -- Anomali B93
         art_5th_4_roster.b5r28_value = 1 and (art_5th_4_roster.b5r32a_value between 10000 and 33999) or
         (art_5th_4_roster.b5r32a_value between 45000 and 56999) and art_5th_4_roster.b5r33a1_value = 2 and art_5th_4_roster.b5r33a2_value = 4 and art_5th_4_roster.b5r33a3_value = 2
       ) THEN 'B93,' END,
       CASE WHEN(
          -- Anomali B96
         art_5th_4_roster.b5r28_value = 1 and ((art_5th_4_roster.b5r32a_value between 10000 AND 33999) OR (art_5th_4_roster.b5r32a_value between 45000 and 56999)) and art_5th_4_roster.b5r33b_value = 2
       ) THEN 'B96,' END,
       CASE WHEN(
          -- Anomali B98
          art_5th_5_roster.b5r34a_jml > 40 and  art_5th_5_roster.b5r35a_value=1
       ) THEN 'B98,' END,
       CASE WHEN(
          -- Anomali B99
          art_5th_5_roster.b5r35b_value = 4
       ) THEN 'B99,' END,
       CASE WHEN(
          -- Anomali B101
          art.b4k10>= 50  and  art_5th_6_roster.b5r37a_value = 1
       ) THEN 'B101,' END,
       CASE WHEN(
          -- Anomali B102
          art.b4k10>= 50  and  art_5th_6_roster.b5r37b_value = 1
       ) THEN 'B102,' END,
       CASE WHEN(
          -- Anomali B103
          art_5th_6_roster.b5r37a_value =1  or  
          art_5th_6_roster.b5r38a_value=1  and   
          art_5th_6_roster.b5r40e_value =1
       ) THEN 'B103,' END,
       CASE WHEN(
          -- Anomali B104
          (art_5th_6_roster.b5r37b_value =1 OR art_5th_6_roster.b5r38b_value=1 ) and (art_5th_6_roster.b5r40d_value  =2 or art_5th_6_roster.b5r40e_value =2 or art_5th_6_roster.b5r40f_value =2 )
       ) THEN 'B104,' END,
       CASE WHEN(
          -- Anomali B105
          (art_5th_6_roster.b5r37a_value =1 OR art_5th_6_roster.b5r38a_value=1)
          and (art_5th_6_roster.b5r40a_value =2 AND art_5th_6_roster.b5r40b_value =2 AND art_5th_6_roster.b5r40c_value =2 AND
          art_5th_6_roster.b5r40d_value=2 AND art_5th_6_roster.b5r40f_value =2)
       ) THEN 'B105,' END,
       CASE WHEN(
          -- Anomali B106
          art_5th_6_roster.b5r37a_value = 1 or art_5th_6_roster.b5r37b_value =1 or art_5th_6_roster.b5r38a_value=1 or
          art_5th_6_roster.b5r38b_value=1 and art_5th_6_roster.b5r39_bln >1
       ) THEN 'B106,' END,
       CASE WHEN(
          -- Anomali B108
          (art_5th_6_roster.b5r41a_value = 7 or art_5th_6_roster.b5r41a_value = 8 ) and (art_5th_2_roster.b5r9a_value= 1 or
          art_5th_2_roster.b5r9b_value= 1 or art_5th_2_roster.b5r9c_value = 1 or art_5th_2_roster.b5r10_value =1)
       ) THEN 'B108,' END,
       CASE WHEN(
          -- Anomali B110
          art_5th_6_roster.b5r41a_value = 3
       ) THEN 'B110,' END,
       CASE WHEN(
          -- Anomali B111
          (art_5th_2_roster.b5r9a_value= 1 or art_5th_2_roster.b5r9b_value= 1 or art_5th_2_roster.b5r9c_value = 1 or 
          art_5th_2_roster.b5r10_value = 1) and art_5th_6_roster.b5r41a_value = 5
       ) THEN 'B111,' END,
       CASE WHEN(
          -- Anomali B112
          (art_5th_6_roster.b5r41a_value=7) and (art.b4k10<60) and (art_5th_2_roster.b5r8a_value>2 or
          art_5th_2_roster.b5r8b_value>6 or art_5th_2_roster.b5r8c_value>2 or art_5th_2_roster.b5r8d_value>6 OR art_5th_2_roster.b5r8e_value>2 or art_5th_2_roster.b5r8f_value>6)
       ) THEN 'B112,' END,
       CASE WHEN(
          -- Anomali B114
          ((art_5th_7_roster.b5r44a_value = 1) and (art_5th_7_roster.b5r44a_thn < art_5th_3_roster.b5r17a_thn) and
          (art_5th_7_roster.b5r44b_value = 2))
       ) THEN 'B114,' END,
       CASE WHEN(
          -- Anomali B115
          (r53.b5r13a_value=5 or r53.b5r13a_value=6 ) and r57.b5r44b_value=2
       ) THEN 'B115,' END,
       CASE WHEN(
          -- Anomali B116
         art.b4k10 >= 40 and r57.b5r44b_value= 2
       ) THEN 'B116,' END,
       CASE WHEN(
          -- Anomali B119
         art.b4k10 < 7 and r57.b5r49b_value = 1 and r57.b5r49d_value = 2
       ) THEN 'B119,' END,
       CASE WHEN(
          -- Anomali B120
         art.b4k3_value = 2 and r57.b5r49b_value = 2
       ) THEN 'B120,' END,
       CASE WHEN(
          -- Anomali B124
         r59.b5r58 > 0
       ) THEN 'B124,' END,
       CASE WHEN(
          -- Anomali B125
         r59.b5r59 > 0
       ) THEN 'B125,' END,
       CASE WHEN(
          -- Anomali B126
         art.b4k10 >19 AND art_5th_1_roster.b5r5_value=3 and art_5th_1_roster.b5r6a_value>3
         AND art_5th_2_roster.b5r9a_value=2 and art_5th_2_roster.b5r9b_value=2
         AND art_5th_2_roster.b5r9c_value=2 AND art_5th_2_roster.b5r10_value=2 
         AND (art_5th_2_roster.b5r8a_value>2 or art_5th_2_roster.b5r8b_value>6 or
         art_5th_2_roster.b5r8c_value>2 or art_5th_2_roster.b5r8d_value>6 OR
         art_5th_2_roster.b5r8e_value>2 or art_5th_2_roster.b5r8f_value>6)
         AND (art_5th_6_roster.b5r37a_value=2 OR art_5th_6_roster.b5r37b_value=2 or art_5th_6_roster.b5r41a_value<4)
       ) THEN 'B126,' END
       ) as Anomali,
       CONCAT('<a href="https://fasih-sm.bps.go.id/survey-collection/assignment-detail/',
              art.assignment_id
           , '/08ccfdf5-9c7f-4379-9a4c-09ce265d20b9" target="_blank">Link Assignment</a>') AS Link
FROM tlg_ed6f1363.art_roster art
         LEFT JOIN tlg_ed6f1363.root_table r_root
                   ON r_root.assignment_id = art.assignment_id
         LEFT JOIN tlg_ed6f1363.base_table_assignment asg
                ON asg.id = art.assignment_id
         LEFT JOIN tlg_ed6f1363.art_5th_1_roster r51
                   ON r51.assignment_id = art.assignment_id
                       AND r51.index1 = art.index1
         LEFT JOIN tlg_ed6f1363.art_5th_2_roster r52
                   ON r52.assignment_id = art.assignment_id
                       AND r52.index1 = art.index1
         LEFT JOIN tlg_ed6f1363.art_5th_3_roster r53
                   ON r53.assignment_id = art.assignment_id
                       AND r53.index1 = art.index1
         LEFT JOIN tlg_ed6f1363.art_5th_4_roster r54
                   ON r54.assignment_id = art.assignment_id
                       AND r54.index1 = art.index1
         LEFT JOIN tlg_ed6f1363.art_5th_5_roster r55
                   ON r55.assignment_id = art.assignment_id
                       AND r55.index1 = art.index1
         LEFT JOIN tlg_ed6f1363.art_5th_6_roster r56
                   ON r56.assignment_id = art.assignment_id
                       AND r56.index1 = art.index1
         LEFT JOIN tlg_ed6f1363.art_5th_7_roster r57
                   ON r57.assignment_id = art.assignment_id
                       AND r57.index1 = art.index1
         LEFT JOIN tlg_ed6f1363.art_15th_9_roster r59
                   ON r59.assignment_id = art.assignment_id
                       AND r59.index1 = art.index1
         LEFT JOIN tlg_ed6f1363.art_roster ibu 
                    ON ibu.assignment_id=art.assignment_id 
                      and ibu.index1=art.b4k11
        LEFT JOIN tlg_ed6f1363.art_5th_1_roster
                   ON art_5th_1_roster.assignment_id = art.assignment_id
                       AND art_5th_1_roster.index1 = art.index1
        LEFT JOIN tlg_ed6f1363.art_5th_2_roster
                   ON art_5th_2_roster.assignment_id = art.assignment_id
                       AND art_5th_2_roster.index1 = art.index1
         LEFT JOIN tlg_ed6f1363.art_5th_3_roster
                   ON art_5th_3_roster.assignment_id = art.assignment_id
                       AND art_5th_3_roster.index1 = art.index1
        LEFT JOIN tlg_ed6f1363.art_5th_4_roster
                   ON art_5th_4_roster.assignment_id = art.assignment_id
                       AND art_5th_4_roster.index1 = art.index1
        LEFT JOIN tlg_ed6f1363.art_5th_5_roster 
                   ON art_5th_5_roster.assignment_id = art.assignment_id
                       AND art_5th_5_roster.index1 = art.index1
        LEFT JOIN tlg_ed6f1363.art_5th_6_roster 
                   ON art_5th_6_roster.assignment_id = art.assignment_id
                       AND art_5th_6_roster.index1 = art.index1
        LEFT JOIN tlg_ed6f1363.art_5th_7_roster
                   ON art_5th_7_roster.assignment_id = art.assignment_id
                       AND art_5th_7_roster.index1 = art.index1
        LEFT JOIN (SELECT pair_value, pair_label, assignment_id, index1
                    FROM tlg_ed6f1363.pair_label_value_1
                    WHERE data_key = 'b5r6g1_s'
                      AND pair_value = 'A') b5r6g1_s
                   ON b5r6g1_s.assignment_id = art.assignment_id
                       AND b5r6g1_s.index1 = art.index1
        LEFT JOIN (SELECT pair_value, pair_label, assignment_id, index1
                    FROM tlg_ed6f1363.pair_label_value_1
                    WHERE data_key = 'b5r6g2_s'
                      AND pair_value = 'A') b5r6g2_s
                   ON b5r6g2_s.assignment_id = art.assignment_id
                       AND b5r6g2_s.index1 = art.index1
        LEFT JOIN (SELECT pair_value, pair_label, assignment_id, index1
                    FROM tlg_ed6f1363.pair_label_value_1
                    WHERE data_key = 'b5r6g3_s'
                      AND pair_value = 'A') b5r6g3_s
                   ON b5r6g3_s.assignment_id = art.assignment_id
                       AND b5r6g3_s.index1 = art.index1
        
ORDER BY art.level_6_full_code, r_root.no_dsrt, art.index1